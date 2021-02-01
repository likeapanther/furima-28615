FactoryBot.define do
  factory :purchase do
    price         {3000}
    token         {"tok_abcdefghijk00000000000000000"}
    association :item
    asoociation :user
  end
end
