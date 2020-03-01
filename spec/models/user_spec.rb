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

      expect(user.under_age?).to be_truthy
    end

    it 'verifies the over age user' do
      user.update(birth_date: '2000-05-05')

      expect(user.under_age?).to be_falsy
    end
  end

  context "Use user's rolify methods" do
    it 'verifies admin role' do
      expect(create(:user, :admin).admin?).to be_truthy
    end

    it 'verifies customer role' do
      expect(create(:user, :customer).customer?).to be_truthy
    end

    it 'verifies manager role' do
      expect(create(:user, :manager).manager?).to be_truthy
    end

    it 'returns false when user has not any role' do
      expect(create(:user).any_role?).to be_falsy
    end
  end
end
