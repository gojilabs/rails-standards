# frozen_string_literal: true

Rails.application.config.active_job.queue_adapter = :sidekiq if Rails.application.config.respond_to?(:active_job) && defined?(Sidekiq)
