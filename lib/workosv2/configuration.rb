# frozen_string_literal: true
# typed: true

module WorkOSV2
  # Configuration class sets config initializer
  class Configuration
    attr_accessor :timeout, :key

    def initialize
      @timeout = 60
    end

    def key!
      key or raise '`WorkOSV2.config.key` not set'
    end
  end
end
