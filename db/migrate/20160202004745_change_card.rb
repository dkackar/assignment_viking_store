class ChangeCard < ActiveRecord::Migration
  def change
    change_column :payments, :card_number, :bigint
  end
end
