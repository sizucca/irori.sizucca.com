require_relative 'boot'

require 'rails/all'
require 'rack/rewrite'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Irori
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    if ENV['RACK_ENV'] == 'production'
      config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
        r301 %r{.*}, 'https://irori.sizucca.com$&', :if => Proc.new { |rack_env|
          rack_env['SERVER_NAME'] != 'irori.sizucca.com'
        }
      end
    end
  end
end

