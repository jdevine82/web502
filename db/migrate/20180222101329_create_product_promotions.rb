class CreateProductPromotions < ActiveRecord::Migration
  def change
    create_table :product_promotions do |t|
      t.column :product_id, :integer
      t.column :promotion_id, :integer
    end
    add_foreign_key :product_promotions, :product_id
    add_foreign_key :product_promotions, :promotion_id
  end
end
