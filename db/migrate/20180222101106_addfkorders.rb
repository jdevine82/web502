class Addfkorders < ActiveRecord::Migration
  def change
    add_foreign_key :product_orders, :order_id
    add_foreign_key :product_orders, :product_id
     add_foreign_key :orders, :customer_id
  end
end
