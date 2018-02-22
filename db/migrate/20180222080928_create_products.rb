class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :author, :string
      t.column :title, :string
      t.column :year, :integer
      t.column :publisher, :string
      t.column :description, :string
      t.column :price, :float
      t.column :first_creation_date, :datetime
      t.timestamps null: false
    end
  end
end
