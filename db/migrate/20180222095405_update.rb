class CreateOrders< ActiveRecord::Migration
  def change 
     create_table :orders
      add_column :orders, :date, :datetime
      add_column :orders, :customer_id, :integer
      add_column :orders, :customer_order_no, :string

    
    end
    add_foreign_key :orders, :customer_id
  end


