class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.float :price
      t.integer :quantity
      t.references :product, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
