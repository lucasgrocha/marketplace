require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'when product has valid attributes' do
    it 'is valid with valid attributes' do
      expect(build(:product)).to be_valid
    end

    it 'is valid without a description' do
      expect(build(:product, description: '')).to be_valid
    end
  end

  context 'when product has invalid attributes' do
    it 'is not valid without a title' do
      expect(build(:product, title: '')).not_to be_valid
    end

    it 'is not valid when has invalid price' do
      expect(build(:product, price: 5)).not_to be_valid
    end

    it 'is not valid without code' do
      expect(build(:product, code: '')).not_to be_valid
    end

    it 'is not valid without bar code' do
      expect(build(:product, bar_code: '')).not_to be_valid
    end

    it 'is not valid without manufacturer' do
      expect(build(:product, manufacturer: '')).not_to be_valid
    end

    it 'is not valid without model' do
      expect(build(:product, model: '')).not_to be_valid
    end

    it 'is not valid when has invalid bar code' do
      expect(build(:product, bar_code: 123_456_789)).not_to be_valid
    end

    it 'is not valid when has not a category' do
      expect(build(:product, category: nil)).not_to be_valid
    end
  end
end
