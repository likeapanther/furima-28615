FactoryBot.define do
  factory :item do
    title { Faker::Book.title }
    description { Faker::Lorem.sentences }
    category_id { 2 }
    condition_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price { Faker::Number.between(from:300, to: 9999999) }
    association :user
  end
end
