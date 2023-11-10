# frozen_string_literal: true

if defined?(Sidekiq) && defined?(SidekiqAlive)
  SidekiqAlive.setup do |config|
    config.shutdown_callback = proc do
      Sidekiq::Queue.all.each { |queue| queue.clear if queue.name.starts_with?(config.queue_prefix.to_s) }
    end
  end
end
