FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    detail { 'This is a sample item.' }
    price { 500 }
    category_id { 2 }
    status_id { 2 }
    ship_fee_id { 2 }
    region_id { 2 }
    ship_day_id { 2 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
