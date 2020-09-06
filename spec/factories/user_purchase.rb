FactoryBot.define do
  factory :user_purchase do
    postal_code { '210-2222' }
    prefectures_id { '1' }
    city { '港区赤坂' }
    address { '1-2-3' }
    phone_number { '08046574848' }
  end
end
