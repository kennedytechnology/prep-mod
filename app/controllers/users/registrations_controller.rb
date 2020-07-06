class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :update], if: :devise_controller?
  before_action :redirect_to_root, only: [:new, :create]
  layout "clinic_management"

  protected

  def redirect_to_root
    redirect_to "/pages/landing_page"
  end

  def configure_sign_up_params    
    added_attribs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attribs
    devise_parameter_sanitizer.permit :sign_up, keys: added_attribs
    devise_parameter_sanitizer.permit :account_update, keys: added_attribs
  end
end