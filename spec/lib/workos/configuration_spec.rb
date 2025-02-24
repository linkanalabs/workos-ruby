# frozen_string_literal: true
# typed: false

describe WorkOSV2 do
  describe '.configure' do
    context 'with key and no timeout' do
      before do
        WorkOSV2.configure do |config|
          config.key = 'example_api_key'
        end
      end

      it 'sets the key and default timeout configuration' do
        expect(WorkOSV2.config.key).to eq('example_api_key')
        expect(WorkOSV2.config.timeout).to eq(60)
      end
    end

    context 'with key and timeout' do
      before do
        WorkOSV2.configure do |config|
          config.key = 'example_api_key'
          config.timeout = 120
        end
      end

      it 'sets the key and timeout configuration' do
        expect(WorkOSV2.config.key).to eq('example_api_key')
        expect(WorkOSV2.config.timeout).to eq(120)
      end
    end
  end
end

describe WorkOSV2::Configuration do
  describe '.key!' do
    context 'with key set' do
      before do
        WorkOSV2.config.key = 'example_api_key'
      end

      it 'returns the key' do
        expect(WorkOSV2.config.key!).to eq('example_api_key')
      end
    end

    context 'with key not set' do
      before do
        WorkOSV2.config.key = nil
      end

      it 'throws an error' do
        expect do
          WorkOSV2.config.key!
        end.to raise_error(
          '`WorkOSV2.config.key` not set',
        )
      end
    end
  end
end
