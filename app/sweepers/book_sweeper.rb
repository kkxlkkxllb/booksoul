class BookSweeper < ActionController::Caching::Sweeper
  observe Book
  
  def after_save(book)
    expire_cache_for(book)
  end
  
  def after_destroy(book)
    expire_cache_for(book)
  end
  
  private
  def expire_cache_for(book)
    expire_fragment('all_book_tags')
    expire_fragment("book_tags/#{book.id}")
    expire_fragment("book/show/#{book.id}")
  end
end