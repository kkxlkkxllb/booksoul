class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :nickname,       :null => false
      t.string :email,          :null => false
      t.string :homepage
      t.text   :content,        :null => false
      t.integer :like,          :default => 0
      t.integer :book_page_id,  :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
