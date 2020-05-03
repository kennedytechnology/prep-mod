class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :update], if: :devise_controller?
  layout "clinic_management"

  protected

  def configure_sign_up_params    
    added_attribs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attribs
    devise_parameter_sanitizer.permit :sign_up, keys: added_attribs
    devise_parameter_sanitizer.permit :account_update, keys: added_attribs
  end
end