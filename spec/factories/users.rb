FactoryBot.define do
  factory :user do
    email                 { FFaker::Internet.email }
    first_name            { FFaker::Name.first_name }
    last_name             { FFaker::Name.last_name }
    gender                { FFaker::Gender.sample }
    phone                 { FFaker::PhoneNumber.short_phone_number }
    timezone              { FFaker::Address.time_zone }
    birth_date            { FFaker::Time.date }
    password              { 123_456 }
    password_confirmation { 123_456 }

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    trait :customer do
      after(:create) { |user| user.add_role(:customer) }
    end

    trait :manager do
      after(:create) { |user| user.add_role(:manager) }
    end
  end
end
