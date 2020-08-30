FactoryBot.define do
  factory :item do
    name { 'スマホ' }
    explanation { 'スマホ' }
    category_id { '1' }
    condition_id { '1' }
    delivery_fee_id { '1' }
    shipping_origin_id { '1' }
    days_until_shipping_id { '1' }
    value { '300' }
  end
end
