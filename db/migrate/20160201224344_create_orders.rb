class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_street
      t.string :shipping_city
      t.string :shipping_state
      t.integer :shipping_zip
      t.string :billing_street
      t.string :billing_city
      t.string :billing_state
      t.integer :billing_zip
      t.integer :phone_number
      t.string :status
      t.float :total
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
