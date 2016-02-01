class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :card_number
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.date :expiry_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
