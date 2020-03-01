FactoryBot.define do
  factory :coupon do
    code            { SecureRandom.alphanumeric(6).upcase }
    discount_amount { rand(10..90) }
    discount_type   { %i[percentage fixed].sample }
    expiration_date { FFaker::Time.date }
  end
end
