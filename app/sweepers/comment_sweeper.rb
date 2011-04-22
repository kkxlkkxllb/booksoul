class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment
  
  def after_create(comment)
    expire_tag_for(comment)
    expire_cache_for(comment)
  end
  
  def after_update(comment)
    expire_cache_for(comment)
  end
  
  def after_destroy(comment)
    expire_tag_for(comment)
    expire_cache_for(comment)
  end
  
  private
  def expire_tag_for(comment)
    unless comment.book_page_id == 0
      book_page = BookPage.find(comment.book_page_id)
      expire_fragment("book_tags/#{book_page.book_id}")
      expire_fragment("book/show/#{book_page.book_id}")
    end
  end
  
  def expire_cache_for(comment)
    unless comment.book_page_id == 0
      expire_fragment("page/comments/#{comment.book_page_id}")
    end  
  end
end