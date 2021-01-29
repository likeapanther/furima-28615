FactoryBot.define do
  factory :item do
    title         { Faker::Book.title }
    description   { Faker::Lorem.sentences }
    category_id   { Faker::Number.between(from: 2, to: 8) }
    condition_id  { Faker::Number.between(from: 2, to: 5) }
    fee_id        { Faker::Number.between(from: 2, to: 5) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    day_id        { Faker::Number.between(from: 2, to: 5) }
    price         { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
