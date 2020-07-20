class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, only: [:create], if: :devise_controller?
  layout "clinic_management", only: [:new]

  def after_invite_path_for(resource)
    pages_landing_page_path
  end

  def after_accept_path_for(resource)
    pages_landing_page_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :role, :county, :venues ])
  end
end
