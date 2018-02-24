class Change < ActiveRecord::Migration
  def change
    remove_column :products, :first_creation_date
  end
end
