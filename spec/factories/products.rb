FactoryBot.define do
  factory :product do
    title        { FFaker::Book.title }
    price        { FFaker::Random.rand(50.0..5000).round(2) }
    code         { SecureRandom.hex  }
    bar_code     { FFaker::Code.ean }
    manufacturer { FFaker::Company.name }
    model        { SecureRandom.urlsafe_base64(6).upcase }
    description  { FFaker::Lorem.paragraphs.join(' ') }

    association :category, factory: :category
  end
end
