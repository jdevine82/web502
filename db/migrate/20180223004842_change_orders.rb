class ChangeOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :integer
  
  end
end
