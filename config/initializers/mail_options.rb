if Rails.env.production?
  Rails.application.routes.default_url_options[:host] = 'cwdemo.net'
  Rails.application.routes.default_url_options[:protocol] = 'https'
end