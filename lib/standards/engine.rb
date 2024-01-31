# frozen_string_literal: true

module Standards
  class Engine < ::Rails::Engine
    isolate_namespace Standards
    config.generators.api_only = true

    config.to_prepare do
      # load '../../config/initializers/oj'
    end
  end
end
