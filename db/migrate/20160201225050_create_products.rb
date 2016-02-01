class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.float :price
      t.integer :quantity
      t.integer :stock
      t.string :sku
      t.string :title
      t.text :description
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
