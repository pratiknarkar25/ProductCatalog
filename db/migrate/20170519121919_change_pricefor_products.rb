class ChangePriceforProducts < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :price, :float, precision: 8, scale:2
  end
end
