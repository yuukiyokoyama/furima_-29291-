class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,   null: false
      t.string :prefectures_id,   null: false
      t.string :city,          null: false
      t.string :address,       null: false
      t.string :building_name
      t.string :phone_number,  null: false
      t.references :item_purchase, null: false,  foreign_key: true
      t.timestamps
    end
  end
end


