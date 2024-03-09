# frozen_string_literal: true

if defined?(Sidekiq)
  require_relative './sidekiq_logger'

  sidekiq_logger = SidekiqLogger.new(STDOUT)
  Sidekiq.configure_client do |sk|
    sk.redis = { url: ENV.fetch('WORKER_REDIS_URL', 'redis://localhost:6379/1') }
    sk.logger = sidekiq_logger
  end

  Sidekiq.configure_server do |sk|
    sk.redis = { url: ENV.fetch('WORKER_REDIS_URL', 'redis://localhost:6379/1') }
    sk.logger = sidekiq_logger
  end

  if defined?(SidekiqAlive)
    SidekiqAlive.setup do |config|
      config.logger = sidekiq_logger
      config.shutdown_callback = proc do
        Sidekiq::Queue.all.find { |q| q.name == "#{config.queue_prefix}-#{SidekiqAlive.hostname}" }&.clear
      end
    end
  end
end
