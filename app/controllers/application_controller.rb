class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_time_zone, if: :user_signed_in?

  def after_sign_in_path_for(resource)
    pets_path
  end

  def after_sign_up_path_for(resource)
    pets_path
  end

  private
  def set_time_zone
    Time.zone = current_user.time_zone
  end

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
