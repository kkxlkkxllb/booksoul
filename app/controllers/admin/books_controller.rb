class Admin::BooksController < Admin::ResourcesController
  cache_sweeper :book_sweeper
  def generate
    @book = Book.find(params[:book_id])
    @path = params[:book_url]
    lines = File.readlines(@path)  
    if !@book.has_generated?  
      all_text = lines.join
      i = 0
      words_per_page = 2000
      page = []
      while i < all_text.size/words_per_page
        page[i] = all_text[i*words_per_page..(i+1)*words_per_page-1]
        sentence = page[i].split(/\n/)
        if i == 0
          sentence_start = sentence_end = ''
        else
          sentence_start = sentence_end
        end
        sentence_end = sentence[sentence.size-1]  
        content = sentence_start + page[i].sub(sentence_end,'')
        BookPage.create(:content => content,:book_id => @book.id,:num => i+1)     
        i = i + 1   
      end
      the_last = i*words_per_page
      page[i] = all_text[the_last..all_text.size]
      content = sentence_end + page[i]
      BookPage.create(:content => content,:book_id => @book.id,:num => i+1)
      flash[:notice] = "Generate Success!"
    end
    redirect_to "/admin/books"
  end
end
