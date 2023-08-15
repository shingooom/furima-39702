FactoryBot.define do
  factory :user do
    nickname          { Faker::Name.initials(number: 2) }
    email             { Faker::Internet.email }
    password          { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name        { '晋吾' }
    last_name         { '前田' }
    first_name_kana   { 'シンゴ' }
    last_name_kana    { 'マエダ' }
    birthday          { Faker::Date.birthday }
  end
end
