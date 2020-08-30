class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :days_until_shipping

  has_one_attached :image   
  
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :delivery_fee, presence: true
  validates :shipping_origin, presence: true
  validates :days_until_shipping, presence: true
  VALUE_REGEX = /\A[0-9]+\z/
  validates :value, presence: true, format: { with: VALUE_REGEX}
  validates_inclusion_of :value, in: 300..9999999
end
