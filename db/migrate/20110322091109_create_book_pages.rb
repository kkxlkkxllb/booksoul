class CreateBookPages < ActiveRecord::Migration
  def self.up
    create_table :book_pages do |t|
      t.integer :num,       :null => false
      t.text :content,      :null => false
      t.integer :book_id,   :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :book_pages
  end
end
