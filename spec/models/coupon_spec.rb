require 'rails_helper'

RSpec.describe Coupon, type: :model do
  context 'when has invalid type' do
    it 'raises error on creating' do
      expect { build_stubbed(:coupon, discount_type: 'abc') }.to raise_error ArgumentError
    end
  end

  describe '#expired?' do
    subject(:coupon) { build_stubbed(:coupon) }

    context 'when expiration_date is in the past' do
      it 'returns true' do
        coupon.expiration_date = DateTime.now - 1.day

        expect(should be_expired)
      end
    end

    context 'when expiration_date is in the future' do
      it 'returns false' do
        coupon.expiration_date = DateTime.now + 1.day

        expect(should_not be_expired)
      end
    end
  end
end
