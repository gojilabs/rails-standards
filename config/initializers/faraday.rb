# frozen_string_literal: true

require 'httpx/adapters/faraday'
require 'faraday/retry'

Faraday.default_adapter = :httpx
