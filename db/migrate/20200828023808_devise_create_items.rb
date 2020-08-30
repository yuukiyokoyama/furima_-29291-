# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :explanation,            null: false
      t.integer :value,               null: false
      t.integer :category_id,            null: false
      t.integer :condition_id,           null: false
      t.integer :delivery_fee_id,        null: false
      t.integer :shipping_origin_id,     null: false
      t.integer :days_until_shipping_id, null: false
      t.references :user,             null: false, foreign_key: true

      ## Database authenticatable
      

      ## Recoverable
     

      ## Rememberable
      

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

  end
end
