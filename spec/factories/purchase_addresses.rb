FactoryBot.define do
  factory :purchase_address do
    user_id { User.first.id || association(:user).id }
    item_id { Item.first.id || association(:item).id }
    postcode { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    region_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    building { Faker::Address.secondary_address }
    phone { Faker::Number.leading_zero_number(digits: rand(10..11)) }
    token { SecureRandom.hex(10) }
  end
end