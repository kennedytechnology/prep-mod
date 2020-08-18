class ApplicationController < ActionController::Base
  before_action :set_cache_headers
  before_action :set_locale
  helper_method :logo_path
  before_action :set_notification

  rescue_from CanCan::AccessDenied do |exception|
    logger.debug exception.inspect
    render file: 'public/401.html', status: :unauthorized
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]

    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
        parsed_locale.to_sym : nil
  end

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

  def template_for_homepage
    params['template'] || ENV['TEMPLATE_FOR_HOMEPAGE'] || 'index' || ENV["CONSENT_FORM_LOGO"]
  end

  def set_notification
    request.env['exception_notifier.exception_data'] = { 'site_url' => ENV['SITE_URL'] }
    # can be any key-value pairs
  end


  def logo_path
    "logo-#{template_for_homepage}.png"
  end
end
