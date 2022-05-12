# frozen_string_literal: true

if ENV['SENDGRID_PASSWORD'].present?
  ActionMailer::Base.smtp_settings = {
    user_name:            'apikey',
    password:             ENV.fetch('SENDGRID_PASSWORD', 'bogus'),
    domain:               ENV.fetch('APP_HOST', 'localhost'),
    address:              'smtp.sendgrid.net',
    port:                 587,
    authentication:       :plain,
    enable_starttls_auto: true
  }
end

Rails.application.config.action_mailer.default_url_options = Rails.application.default_url_options
Rails.application.config.action_mailer.perform_deliveries = true
Rails.application.config.action_mailer.raise_delivery_errors = !Rails.env.production?
Rails.application.config.action_mailer.perform_caching = Rails.env.production? || Rails.env.staging?
