# frozen_string_literal: true

if defined?(Sidekiq) && defined?(SidekiqAlive)
  SidekiqAlive.setup do |config|
    config.callback = proc do
      # execute this only from worker pod
      if SidekiqAlive.hostname.starts_with?('worker')
        Sidekiq::Queue.all.each do |queue|
          # skip other queues (default, critical, etc.)
          next unless queue.name.starts_with?(config.queue_prefix.to_s)
          # keep actual sidekiq-alive-<hostname> queue
          next if queue.name == "#{config.queue_prefix}-#{SidekiqAlive.hostname}"

          queue.clear
        end
      end
    end
  end
end
