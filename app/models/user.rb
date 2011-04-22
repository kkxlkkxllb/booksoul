class User < ActiveRecord::Base
  validates :nickname,:presence => true
  validates :email,:presence => true,:uniqueness => true
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  nickname   :string(255)     not null
#  email      :string(255)     not null
#  homepage   :string(255)
#  uid        :string(255)
#  provider   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

