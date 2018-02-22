class AddAttachmentFrontPageToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :front_page
    end
  end

  def self.down
    remove_attachment :products, :front_page
  end
end
