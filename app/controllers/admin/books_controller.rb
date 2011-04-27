class Admin::BooksController < Admin::ResourcesController
  cache_sweeper :book_sweeper
  
end
