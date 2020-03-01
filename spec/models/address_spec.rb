require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'creates an address' do
    expect {
      create(:address)
    }.to change(Address, :count)
  end

  it 'does not create an address with invalid building number' do
    expect { create(:address, building_number: 0) }.to raise_error ActiveRecord::RecordInvalid
  end
end
