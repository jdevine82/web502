class DropTableProductOrders < ActiveRecord::Migration
  def change
    drop_table :Product_Orders
    
  end
end
