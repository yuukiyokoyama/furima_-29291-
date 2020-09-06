class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  VALUE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, presence: true, format: { with: VALUE_REGEX }
  validates :prefectures_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  VALUE_REGEX = /\A(0{1}\d{9,10})\z/.freeze
  validates :phone_number, presence: true, format: { with: VALUE_REGEX }

  def save
    itempurchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_purchase_id: itempurchase.id)
  end
end
