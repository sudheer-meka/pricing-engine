require 'rails_helper'

RSpec.describe Cache do
  describe 'public class methods' do
    context 'responds to its methods' do
      it { expect(described_class).to respond_to(:get) }
      it { expect(described_class).to respond_to(:set) }
      it { expect(described_class).to respond_to(:clear) }
      it { expect(described_class).to respond_to(:cache_time) }
      it { expect(described_class).to respond_to(:expired?) }
      it { expect(described_class).to respond_to(:cached_data) }
    end

    context 'executes methods correctly' do
      context 'expired' do
        it 'returns true if value is expired' do
          described_class.cached_data = { key: { time: Time.zone.now - 100 } }
          expect(described_class.expired?(:key)).to eq(true)
        end

        it 'returns false if value is not expired' do
          described_class.cached_data = { key: { time: Time.zone.now + 100 } }
          expect(described_class.expired?(:key)).to eq(false)
        end
      end

      context 'set' do
        it 'sets value to the given key and returns the value' do
          described_class.set(:random, 'TEST')
          expect(described_class.cached_data.key?(:random)).to eq(true)
          expect(described_class.set(:random, 'TEST1')).to eq('TEST1')
        end
      end

      context 'get' do
        it 'returns value if key present in store and not expired' do
          described_class.set(:random, 'TEST')
          expect(described_class.get(:random)).to eq('TEST')
        end

        it 'stores value if key is not present in store or expired' do
          described_class.clear
          described_class.get(:random) do
            'TEST1'
          end
          expect(described_class.get(:random)).to eq('TEST1')
        end
      end

      context 'clear' do
        it 'to clear cached data' do
          described_class.set(:random, 'TEST')
          described_class.clear
          expect(described_class.cached_data.present?).to eq(false)
        end
      end
    end
  end
end
