class UsersController < ApplicationController

   def show
      @user = User.find(params[:id])
   end

   def follow
      @user = User.find(params[:id])
      current_user.followees << @user
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
end
