class ApplicationController < ActionController::Base
  
  # Config flash for the whole app --> To keep?
  # add_flash_types :success, :danger, :info, :warning, :alert

  # Include first name and last name into Devise process

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end

end
