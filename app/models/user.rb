class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_purchases

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A[a-z]+[\d]+[a-z\d]+\z/.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX	}
  FAMILY_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :family_name, presence: true, format: { with: FAMILY_NAME_REGEX }
  FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name, presence: true, format: { with: FIRST_NAME_REGEX }
  FAMILY_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :family_name_kana, presence: true, format: { with: FAMILY_NAME_KANA_REGEX }
  FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: FIRST_NAME_KANA_REGEX }
  validates :birthday, presence: true
end
