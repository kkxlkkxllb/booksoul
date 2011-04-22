class BooksController < ApplicationController
  
  def index
     set_seo_meta(nil,t('seo.keywords.home'),t('seo.describe.home'))
     @books = Book.order("created_at desc").page(params[:page])
     respond_to do |format|
       format.html
       format.js
     end
  end
  #books/:id
  def show
     @book = Book.find_by_title(params[:id])
     set_seo_meta(@book.title,@book.keyword_list,@book.info)
     @comment = @book.comments.order("like desc").first()
  end
  #tag 分类书籍
  def tag
    @books = Book.tagged_with(params[:id]).page(params[:page])
    set_seo_meta("#{t('book.tags')}:#{params[:id]}")
    respond_to do |format|
      format.html{render :index}
      format.js
    end
  end
  #手气不错
  def rand_read
    @book = Book.find("random")
    redirect_to "/books/#{@book.title}"
  end

end
