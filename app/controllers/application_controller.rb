class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, :set_user
    
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :middle_name, :last_name, :mobile, :birthday, :is_approved, {roles: []}, :email, :password, :current_password)}
        end

        def set_user
            if user_signed_in?
                @user = current_user
            end
        end
end
