class Upload < ActiveRecord::Base
   validates :contact,:presence => true
   has_attached_file :book
   validates_attachment_size :book, :less_than => 5.megabytes
   validates_attachment_presence :book
   validates_attachment_content_type :book,  
     :content_type => [ 'application/pdf', 'text/plain', 'application/msword', 'text/html' ],  
     :allow_nil => false
end

# == Schema Information
#
# Table name: uploads
#
#  id                :integer         not null, primary key
#  title             :string(255)     not null
#  book_file_name    :string(255)
#  book_content_type :string(255)
#  book_file_size    :integer
#  book_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

