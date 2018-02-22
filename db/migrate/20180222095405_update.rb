class CreateOrders< ActiveRecord::Migration
  def change 
     create_table :orders do |t|
      t.column :date, :datetime
      t.column :customer_id, :integer
      t.column  :customer_order_no, :string

      end
    end
    add_foreign_key :orders, :customer_id
  end


