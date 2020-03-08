require 'rails_helper'

RSpec.describe "Api::V1::Coupons", type: :request do
  context 'when has valid params' do
    let(:coupon_attributes) { attributes_for(:coupon, category_id: category.id) }
    let(:category) { build(:category) }

    before do
      post '/api/v1/coupon', params: { coupon: coupon_attributes, format: :json }
    end

    it 'creates a new coupon' do
      expect(response).to have_http_status(:created)
      expect(Coupon.exists?(coupon_attributes)).to be_truthy
    end
  end

  context 'when coupon already exists' do
    let(:coupon_attributes) { attributes_for(:coupon) }

    before do
      2.times { post '/api/v1/coupon', params: { coupon: coupon_attributes, format: :json } }
    end

    it 'retuns 422 http status code' do
      expect(response).to have_http_status(422)
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq('Coupon already exists')
    end
  end

  context 'when category does not exists' do
    let(:coupon_attributes) { attributes_for(:coupon, category_id: 0) }

    before do
      post '/api/v1/coupon', params: { coupon: coupon_attributes, format: :json }
    end

    it 'returns 404 http status code' do
      expect(response).to have_http_status(404)
    end

    it 'returns category not found' do
      expect(JSON.parse(response.body)['error']).to eq('Could not find category')
    end
  end
end
