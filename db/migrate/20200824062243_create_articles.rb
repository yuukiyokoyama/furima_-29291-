class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :category      , null: false
      t.string     :condition     , null: false
      t.integer    :delivery_fee     , null: false
      t.string     :shipping_origin    , null: false
      t.string     :days_until_shipping    , null: false
      t.timestamps
    end
  end
end
