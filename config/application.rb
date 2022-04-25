require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StocksApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_job.queue_adapter = :resque

    config.after_initialize do
      FetchCompanyPricesJob.perform_later(100)
      FetchCompanyPricesJob.perform_later(101)
      FetchCompanyPricesJob.perform_later(102)
      FetchCompanyPricesJob.perform_later(103)
      FetchCompanyPricesJob.perform_later(104)
      FetchCompanyPricesJob.perform_later(105)
    end

  end
end
