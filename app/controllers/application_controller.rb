class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

 def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :password, :avatar)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password,:remember_me, :avatar, :avatar_cache, :remove_avatar])
 end
end
