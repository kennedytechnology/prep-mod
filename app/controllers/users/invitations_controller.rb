class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, only: [:create], if: :devise_controller?
  layout "clinic_management"

  protected

  def configure_permitted_parameters    
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :role])
  end
end