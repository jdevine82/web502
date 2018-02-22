class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|
      t.column :order_id, :integer
      t.column :product_id, :integer
      t.column :product_qty, :integer
      t.column :product_price, :float
      t.column :product_status, :integer, default:0
    end
  end
end
