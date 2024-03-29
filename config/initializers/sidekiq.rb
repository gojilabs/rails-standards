# frozen_string_literal: true

if defined?(Sidekiq)
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV.fetch('WORKER_REDIS_URL', 'redis://localhost:6379/1') }
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV.fetch('WORKER_REDIS_URL', 'redis://localhost:6379/1') }
  end
end
