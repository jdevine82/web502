class Changepromotions < ActiveRecord::Migration
  def change
      add_column :promotions, :start_date, :datetime
      add_column :promotions, :end_date, :datetime
      add_column :promotions, :discount_amount, :float
  end
end
