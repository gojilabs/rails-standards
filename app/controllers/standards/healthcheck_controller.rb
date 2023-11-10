# frozen_string_literal: true

module Standards
  class HealthcheckController < ActionController::API
    def index
      head :ok
    end
  end
end
