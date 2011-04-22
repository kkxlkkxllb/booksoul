class Book < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :keywords
  has_many :book_pages,:dependent => :destroy
  has_many :comments,:through => :book_pages
  validates :title,:presence => true
  validates :author,:presence => true
  validates :info,:presence => true
  has_attached_file :image,
                    :url => "/system/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/system/pictures/:id/:style_:basename.:extension",
                    :styles => { :medium => "137x200", :thumb => "69x100" } 
  validates_attachment_size :image, :less_than => 300.kilobytes
  validates_attachment_content_type :image,
      :content_type => ['image/jpg', 'image/jpeg','image/png'],
      :allow_nil => false
  paginates_per 6
  #随机寻找
  def self.find(*args)
    if args.first.to_s == "random"
      ids = connection.select_all("SELECT id FROM books")
      super(ids[rand(ids.length)]["id"].to_i)
    else
      super
    end
  end
  
  def to_param
    title
  end
  #是否已生成
  def has_generated?
    return self.book_pages.count > 0 ? true : false
  end
  #这本书的评论数
  def comment_count
    self.comments.count
  end
  #这本书的页数
  def page_count
    self.book_pages.count
  end
  
end

# == Schema Information
#
# Table name: books
#
#  id                 :integer         not null, primary key
#  title              :string(255)     not null
#  author             :string(255)     not null
#  info               :text            not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

