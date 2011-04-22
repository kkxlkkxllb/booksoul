class BookPagesController < ApplicationController
  #read_path
  def read
      @book = Book.find_by_title(params[:id])   
      set_seo_meta(@book.title,@book.keyword_list,@book.info)
      read_book(@book)
      @comment = Comment.new   
  end
  #ajax page jump
  def jump
    if params[:page].to_i < session[:page_count]+1 and params[:page].to_i > 0
      @page = BookPage.where(["book_id = ? AND num = ?",session[:book],params[:page]]).first
      set_current_page(@page)
      respond_to do |format|
        format.js
      end
    else
      render :nothing => true
    end
  end
  #ajax翻到上一页
  def last_page
    if current_page.num > 1
      @page = BookPage.find(session[:page] - 1)
      set_current_page(@page)
      respond_to do |format|
        format.js
      end
    else
      render :nothing => true
    end
  end
  #ajax翻到下一页
  def next_page
    if current_page.num < session[:page_count]
      @page = BookPage.find(session[:page] + 1)
      set_current_page(@page)
      respond_to do |format|
        format.js
      end
    else
       render :nothing => true
    end
  end
  #保存当前页面为书签
  def save_bookmark
     cookies[:page],cookies[:book]=nil,nil
     cookies[:page] = {:value => session[:page],:expires => Time.now + 3600*100}
     cookies[:book] = {:value => session[:book],:expires => Time.now + 3600*100}
     render :js => "alert('#{t('bookmark.saved')}')"
  end
  #读取cookies书签并跳转
  def read_bookmark
    if cookies[:page] and cookies[:book]
      @book = Book.find(cookies[:book])
      @page = BookPage.find(cookies[:page])
      book_init(@book,@page)  
      render :js =>  "location.href = '/read/#{@book.title}'" 
    else
      render :js => "alert('#{t('bookmark.fail')}')"
    end
  end

end
