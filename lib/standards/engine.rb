# frozen_string_literal: true

module Standards
  class Engine < ::Rails::Engine
    isolate_namespace Standards
    config.generators.api_only = true

    config.after_initialize do
      ActiveSupport.on_load(:action_mailer) do
        email_password = ENV['SENDGRID_PASSWORD'].presence || ENV['MAILER_PASSWORD'].presence
        if email_password
          self.smtp_settings = {
            user_name: 'apikey',
            password: ENV.fetch('SENDGRID_PASSWORD', 'bogus'),
            domain: ENV.fetch('APP_HOST', 'localhost'),
            address: 'smtp.sendgrid.net',
            port: 587,
            authentication: :plain,
            enable_starttls_auto: true
          }
          self.default_url_options = Rails.application.default_url_options
          self.perform_deliveries = true
          self.raise_delivery_errors = !Rails.env.production?
          self.perform_caching = Rails.env.production? || Rails.env.staging?
        end
      end

      ActiveSupport.on_load(:active_job) do
        self.queue_adapter = :sidekiq if defined?(Sidekiq)
      end

      $global_logger = ActiveSupport::TaggedLogging.new(
        ActiveSupport::Logger.new($stdout)
      ).tap { |me| me.level = ENV.fetch('LOG_LEVEL', 'debug').upcase }

      if defined?(Rails::Console)
        config.logger = Logger.new('/dev/null')
        ActiveSupport.on_load(:active_record) { logger.level = 0 }
      else
        config.logger = $global_logger
        config.log_level = config.logger.level
        config.log_tags = [:remote_ip]

        require 'lograge'

        config.lograge.custom_options = lambda do |event|
          event.payload.tap do |msg|
            msg[:error] = { type: msg.delete(:exception), content: msg.delete(:exception_object) } if msg.key?(:exception)
          end
        end

        config.lograge.ignore_actions = %w[Standards::HealthcheckController#index HealthcheckController#index ApplicationController#healthcheck]
        config.lograge.formatter = Lograge::Formatters::KeyValue.new
        config.lograge.enabled = true
      end

      require_relative '../../config/sidekiq'

      require_relative '../../config/faraday'
      require_relative '../../config/oj'
      # load '../../config/puma' # DO NOT LOAD THIS HERE
      # load '../../config/routes' # DO NOT LOAD THIS HERE
      require_relative '../../config/rollbar'
      require_relative '../../config/rswag_api'
    end
  end
end
