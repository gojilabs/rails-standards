module Standards
  class HealthcheckController < ActionController::API
    def index
      head :ok
    end
  end
end
