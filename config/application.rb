require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.i18n.default_locale = :ja
<<<<<<< HEAD
    config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]
=======
     config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]
     
    config.time_zone = 'Tokyo'
>>>>>>> 25dc696f54b6bcb2e095af0364a98f1cfce7c494

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end

end
