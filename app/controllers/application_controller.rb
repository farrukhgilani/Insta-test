class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :username, :avatar)}
			devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :username, :avatar)}
		end

		def record_not_found
			respond_to do |f|
				f.json {render json: {:message => "Record Not Found"},status: 404}
				f.html {redirect_to root_path, alert: 'Record Not Found'}
			end
		end


end
