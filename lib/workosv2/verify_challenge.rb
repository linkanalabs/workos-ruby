# frozen_string_literal: true
# typed: false

module WorkOSV2
  # The VerifyChallenge class provides a lightweight wrapper around
  # a WorkOSV2 Authentication Challenge resource.
  class VerifyChallenge
    include HashProvider
    extend T::Sig

    attr_accessor :challenge, :valid

    sig { params(json: String).void }
    def initialize(json)
      raw = parse_json(json)
      @challenge = T.let(raw.challenge, Hash)
      @valid = raw.valid
    end

    def to_json(*)
      {
        challenge: challenge,
        valid: valid,
      }
    end

    private

    sig { params(json_string: String).returns(WorkOSV2::Types::VerifyChallengeStruct) }
    def parse_json(json_string)
      hash = JSON.parse(json_string, symbolize_names: true)

      WorkOSV2::Types::VerifyChallengeStruct.new(
        challenge: hash[:challenge],
        valid: hash[:valid],
      )
    end
  end
end
