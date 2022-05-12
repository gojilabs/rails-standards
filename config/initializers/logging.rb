# frozen_string_literal: true

if defined?(Rails::Console)
  Rails.application.config.logger = Logger.new('/dev/null')
  Rails.application.config.after_initialize { ActiveRecord::Base.logger.level = 0 }
else
  Rails.application.config.log_level = ENV.fetch('LOG_LEVEL', 'debug').upcase
  Rails.application.config.log_tags = [:remote_ip]

  logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new($stdout))
  logger.level = Rails.application.config.log_level
  Rails.application.config.logger = logger

  Rails.application.config.lograge.custom_options = lambda do |event|
    data = event.payload

    {}.tap do |msg|
      msg[:error] = { type: data[:exception], content: data[:exception_object] } if data[:exception].present?

      params = data[:params].reject { |key, _| key.to_s == 'controller' || key.to_s == 'action' } if data[:params].present?
      msg[:params] = params if params.present?
    end
  end

  Rails.application.config.lograge.ignore_actions = ['Standards::HealthcheckController#index']
  Rails.application.config.lograge.formatter = Lograge::Formatters::KeyValue.new
  Rails.application.config.lograge.enabled = true
end
