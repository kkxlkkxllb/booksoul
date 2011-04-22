class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title,      :null => false
      t.string :author,     :null => false
      t.text :info,         :null => false
      #paperclip
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
