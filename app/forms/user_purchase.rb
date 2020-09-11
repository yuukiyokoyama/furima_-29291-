class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    VALUE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates :postal_code, format: { with: VALUE_REGEX }
    validates :prefectures_id
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11, messsage: 'too long' }
    validates :token
  end

  def save
    itempurchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_purchase_id: itempurchase.id)
  end
end
