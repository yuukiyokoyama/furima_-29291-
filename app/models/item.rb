class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :item_purchase, dependent: :destroy
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :days_until_shipping

  has_many_attached :images

  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { only_integer: 1 }
  validates :condition_id, numericality: { only_integer: 1 }
  validates :delivery_fee_id, numericality: { only_integer: 1 }
  validates :shipping_origin_id, numericality: { only_integer: 1 }
  validates :days_until_shipping_id, numericality: { only_integer: 1 }
  VALUE_REGEX = /\A[0-9]+\z/.freeze
  validates :value, presence: true, format: { with: VALUE_REGEX }
  validates_inclusion_of :value, in: 300..9_999_999
end
