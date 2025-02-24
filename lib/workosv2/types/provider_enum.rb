# frozen_string_literal: true
# typed: strict

module WorkOSV2
  module Types
    # The ProviderEnum is type-safe declarations of a
    # fixed set of values for SSO Providers.
    class Provider < T::Enum
      enums do
        Google = new('GoogleOAuth')
        Microsoft = new('MicrosoftOAuth')
      end
    end
  end
end
