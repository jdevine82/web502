class Createtableproductorders < ActiveRecord::Migration
  def change
     create_table :product_orders do |t|
       t.column :order_id, :integer
       t.column :product_id, :integer
       t.column :product_qty, :integer
       t.column :product_price, :integer
     end
  end
end
