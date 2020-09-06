class Purchase < ApplicationRecord
  validates :token, presence: true
end
