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
      # Resque.queues.each{|q| Resque.redis.del "queue:#{q}" } ---> clears the queue
      # Company.all.ids.each do |id| ---> Queue jobs to fetch overview, prices, and timeseries
      #   FetchCompanyOverviewJob.perform_later(id)        
      # end      
    end
  end
end
