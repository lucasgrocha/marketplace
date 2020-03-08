require 'rails_helper'

RSpec.describe User, type: :model do
  context "Use user's methods" do
    let(:user) { create(:user) }

    it 'returns full name of user' do
      user.update(first_name: 'Jhon', last_name: 'Michael')

      expect(user.full_name).to eq('Jhon Michael')
    end

    it 'verifies the under age user' do
      user.update(birth_date: '2015-05-05')

      expect(user).to be_under_age
    end

    it 'verifies the over age user' do
      user.update(birth_date: '2000-05-05')

      expect(user).not_to be_under_age
    end
  end

  context "Use user's rolify methods" do
    it 'verifies admin role' do
      expect(create(:user, :admin)).to be_admin
    end

    it 'verifies customer role' do
      expect(create(:user, :customer)).to be_customer
    end

    it 'verifies manager role' do
      expect(create(:user, :manager)).to be_manager
    end

    it 'returns false when user has not any role' do
      expect(create(:user)).not_to be_any_role
    end
  end
end
