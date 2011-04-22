class CommentsController < ApplicationController
  cache_sweeper :comment_sweeper
  def index
    set_seo_meta(t('title.chat'),t('seo.keywords.chat'),t('seo.describe.chat'))
    session[:page] = nil
    @comment = Comment.new
    @comments = Comment.where(["book_page_id = ?",0]).order("like desc").page(params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def create
    if session[:page]
      @book_page = BookPage.find(session[:page])
      new_comment(@book_page.comments)
    else
      new_comment(Comment)
    end
    if @comment.save
      unless current_user?
        set_current_user(@comment.nickname,@comment.email,@comment.homepage)
      end
      if session[:atoken]
         send_tweet(@comment.content)
      end
      respond_to do |format|
        format.html{render :index}
        format.js
      end
    else
      render :action => "fail.js.erb"
    end
  end
  
  def like
    @comment = Comment.find(params[:id])
    @like = @comment.like+1
    if @comment.update_attribute(:like,@like)
      render :nothing => true
    else
      render :js=>"alert('bug');"
    end
  end
  
  private
  def new_comment(obj)
    if current_user?
      @comment = obj.new(:nickname => user_name,
                             :email => user_email,
                             :homepage => user_homepage,
                             :content => params[:comment][:content])
    else
      @comment = obj.new(params[:comment])
    end 
  end

end
