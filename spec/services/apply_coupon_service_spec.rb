require 'rails_helper'

RSpec.describe ApplyCouponService do
  subject { described_class.new(product.id, coupon.code) }
  let(:product) { create(:product, price: 500) }
  let(:coupon)  { create(:coupon, category_id: product.category_id) }

  before do
    coupon.update(expiration_date: DateTime.now + 1.day, discount_amount: 50)
  end

  describe 'when calculation fails' do
    context 'when coupon is expired' do
      before { coupon.update(expiration_date: DateTime.now - 1.day) }

      it 'returns invalid coupon message' do
        expect(subject.perform).to eq('Invalid Coupon')
      end
    end

    context 'when coupon has different category than product' do
      before { coupon.update(category: create(:category)) }

      it 'returns invalid coupon message' do
        expect(subject.perform).to eq('Invalid Coupon')
      end
    end
  end

  describe 'when calculation gets success' do
    context 'when coupon has percentage type' do
      before { coupon.percentage! }

      it 'returns expected price' do
        expect(subject.perform).to eq(250)
      end
    end

    context 'when coupon has fixed type' do
      before { coupon.fixed! }

      it 'returns expected price' do
        expect(subject.perform).to eq(450)
      end
    end
  end
end
