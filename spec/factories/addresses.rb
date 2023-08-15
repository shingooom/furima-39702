FactoryBot.define do
  factory :address do
    association :purchase
    postcode { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    region_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    building { Faker::Address.secondary_address }
    phone { Faker::Number.leading_zero_number(digits: rand(10..11)) }
  end
end
