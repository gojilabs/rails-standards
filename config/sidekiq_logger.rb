class SidekiqLogger < Logger
  def initialize(*args)
    super
    @filtered_jobs = %w[SidekiqAlive heartbeat]
  end

  def add(severity, message = nil, progname = nil)
    (
      message && @filtered_jobs.any? { |job| message.include?(job) }
    ) || super
  end
end
