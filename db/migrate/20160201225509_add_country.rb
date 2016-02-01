class AddCountry < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_country, :string
    add_column :orders, :billing_country, :string
  end
end
