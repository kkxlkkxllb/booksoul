class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :contact,    :null => false
      #paperclip
      t.string :book_file_name
      t.string :book_content_type
      t.integer :book_file_size
      t.datetime :book_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
