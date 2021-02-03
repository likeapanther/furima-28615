FactoryBot.define do
  factory :form do
    zip           { "123-4567" }
    prefecture_id { 5 }
    city          { '横浜市' }
    number        { "５丁目３−１" }
    building      { 'マンション' }
    tel           { 11122223333 }
    token         { 'aaa' }
  end
end
