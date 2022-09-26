class UsersController < ApplicationController

   def show
      @user = User.find(params[:id])
      authorize @user
   end

   def follow
      @user = User.find(params[:id])
      if @user.Public?
         current_user.followees << @user
      else
         begin
            Request.create(sender_id: current_user.id, receiver_id: @user.id)
         rescue
            flash[:alert] = "Already Requested"
         end
      end
      redirect_back(fallback_location: user_path(@user))
   end

   def unfollow
      @user = User.find(params[:id])
      current_user.followed_users.find_by(followee_id: @user.id).destroy
      redirect_back(fallback_location: user_path(@user))
   end

   def account
      if current_user.Public?
         current_user.Private!
      elsif current_user.Private?
         current_user.Public!
      end
      redirect_to user_path(current_user), flash: {notice: "Account type changed to #{current_user.account_type}"}
   end

   def cancel
      @request = Request.find_by(sender_id: current_user.id, receiver_id: params[:id])
      if @request.destroy
         redirect_back(fallback_location: user_path(params[:id]))
      end
   end

   def accept
      @user = User.find(params[:id])
      begin
         current_user.followers << @user
         Request.find_by(sender_id: @user.id, receiver_id: current_user.id).destroy
      rescue
         flash[:alert] = "Request Already Accepted"
      end
      redirect_to root_path
   end
end
