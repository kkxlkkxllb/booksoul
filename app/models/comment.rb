class Comment < ActiveRecord::Base
  after_create :add_user,:send_notice
  include Gravtastic
  gravtastic :size => 40, :filetype => :gif,:secure => true,:default =>"monsterid"
  
  belongs_to :book_page
  validates :nickname,:presence => true,:length => {:maximum => 10}
  validates :email,:presence => true,:email_format=> true
  validates :content,:presence => true,:uniqueness =>{:scope => :email},:length => { :within => 3..1000}
  validates :homepage,:length => {:maximum => 50}
  paginates_per 12
  #总共评注量
  def self.book_comment
    @comments = self.where(["book_page_id > ?",0])
    return @comments.count
  end
  
  private
  #存储用户资料
  def add_user
      @user = User.new(:nickname => self.nickname,:email => self.email,:homepage => self.homepage)
      if @user.save
        UserMailer.delay.welcome_email(@user)
      end
  end
  #发送评论回复通知
  def send_notice
    if self.content[0] == "@" and self.content =~ /:/
      @nickname = self.content.split(':')[0].gsub('@','')
      @user = User.find_by_nickname(@nickname)
      if @user 
        if @user.uid == nil   
          UserMailer.delay.reply_notice(@user,self.content)
        else
          UserMailer.delay.admin_notice(@user,self.content)
        end
      end
    end
  end
  
end

# == Schema Information
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  nickname     :string(255)     not null
#  email        :string(255)     not null
#  homepage     :string(255)
#  content      :text            not null
#  like         :integer         default(0)
#  book_page_id :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

