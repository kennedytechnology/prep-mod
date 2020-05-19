require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cw2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

if Rails.env == "development"
  require "yaml"
  rails_root = Rails.root.to_s || File.dirname(__FILE__) + "/../.."
  env_vars_file = rails_root + "/config/env_vars.yml"

  if File.exists?(env_vars_file)
    config = YAML.load_file(rails_root.to_s + "/config/env_vars.yml")
    if config.key?(Rails.env) && config[Rails.env].is_a?(Hash)
      config[Rails.env].each do |key, value|
        ENV[key] = value.to_s
      end
    end
  else
    puts "WARNING: Local environment variable not found. Please rename the config/env_vars.yml.example file to config/env_vars.yml and provide the necessary values."
  end
end