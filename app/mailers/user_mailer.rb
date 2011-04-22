# coding: utf-8 
class UserMailer < ActionMailer::Base
  default :from => "booksoul.heartme@gmail.com"
  
  def welcome_email(user)
    @user = user
    mail(:to => user.email,
         :subject => "欢迎参与书魂！")
  end
  
  def reply_notice(user,comment)
    @user = user
    @comment = comment
    mail(:to => user.email,
         :subject => "您的评论有回复啦！")
  end
  
  def admin_notice(user,comment)
    @user = user
    @comment = comment
    mail(:to => "kkxlkkxllb@gmail.com",
         :subject => "sina用户有评论回复！")
  end
end
