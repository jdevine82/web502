class ChangeProductOrders < ActiveRecord::Migration
  def change
    remove_column :Product_Orders, :product_status
  end
end
