class BookPage < ActiveRecord::Base
  has_many :comments
  belongs_to :book
  
  validates :num,:presence => true
  validates :content,:presence => true
  validates :book_id,:presence => true

end

# == Schema Information
#
# Table name: book_pages
#
#  id         :integer         not null, primary key
#  num        :integer         not null
#  content    :text            not null
#  book_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

