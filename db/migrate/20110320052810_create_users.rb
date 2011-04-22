class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nickname,   :null => false
      t.string :email,      :null => false
      t.string :homepage
      t.string :uid
      t.string :provider
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
