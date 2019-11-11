class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
  before_action :authenticate_user!  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end
  
  def after_sign_in_path_for(resource)
    users_path
  end

end
