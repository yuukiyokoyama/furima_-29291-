FactoryBot.define do
  factory :item_purchase do
    association :item
    association :user
    association :shipping_address
  end
end
