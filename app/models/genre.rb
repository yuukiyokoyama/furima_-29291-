class Genre < ApplicationRecord
  self.data = [
    { id: 1, name: 'category' },
    { id: 2, name: 'condition' },
    { id: 3, name: 'delivery_fee' },
    { id: 4, name: 'shipping_origin' },
    { id: 5, name: 'days_until_shipping' }
    { id: 6, name: 'postal code' },
    { id: 7, name: 'prefectures' }
  ]
 end
