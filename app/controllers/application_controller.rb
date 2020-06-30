class ApplicationController < ActionController::Base
  before_action :set_cache_headers
  rescue_from CanCan::AccessDenied do |exception|
    logger.debug exception.inspect
    render file: 'public/401.html', status: :unauthorized
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end
