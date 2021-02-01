FactoryBot.define do
  factory :address do
    purchase_id   {2}
    zip           {5}
    prefecture_id {5}
    city          {5}
    number        {5}
    building      {5}
    tel           {5}
    association :purchase
  end
end
