class PhoneBig < ActiveRecord::Migration
  def change
    change_column :orders, :phone_number, :bigint
  end
end
