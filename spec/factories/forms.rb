FactoryBot.define do
  factory :form do
    zip           { "123-4567" }
    prefecture_id { 5 }
    city          { '横浜市' }
    number        { 5 }
    building      { 'マンション' }
    tel           { 11122223333 }
  end
end
