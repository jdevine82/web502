class ChangetypecolumnProductOrders < ActiveRecord::Migration
  def change
    change_column :product_orders, :product_price, :float
  end
end
