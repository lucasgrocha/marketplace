FactoryBot.define do
  factory :address do
    address_line    { FFaker::Address.street_address }
    zip_code        { FFaker::AddressUK.uk_postcode }
    city            { FFaker::Address.city }
    building_number { FFaker::Address.building_number }
    neighborhood    { FFaker::Address.neighborhood }
    state           { FFaker::AddressUS.state }
    country         { FFaker::Address.country }
    datails         { FFaker::Lorem.sentence }

    association :user, factory: :user
  end
end
