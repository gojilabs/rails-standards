# frozen_string_literal: true

if defined?(Sidekiq) && defined?(SidekiqAlive)
  SidekiqAlive.setup do |config|
    config.shutdown_callback = proc do
      Sidekiq::Queue.all.find { |q| q.name == "#{config.queue_prefix}-#{SidekiqAlive.hostname}" }&.clear
    end
  end
end
