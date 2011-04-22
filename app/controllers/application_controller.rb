class ApplicationController < ActionController::Base
  include ActionView::Helpers::SanitizeHelper
  before_filter :set_locale
  protect_from_forgery
  
  def set_locale
    I18n.locale = "zh-CN"
  end
  
  def set_current_user(nickname,email,homepage)
    session[:nickname] = nickname
    session[:email] = email
    session[:homepage] = homepage
  end
  
  def set_current_page(page)
    session[:page] = nil
    session[:page] = page.id
  end
  
  def current_page
    BookPage.find(session[:page])
  end
  
  def set_seo_meta(title,keywords = '',desc = '')
    if title
      @page_title =  "#{title}"
      @page_title += " &raquo; #{t('title.home')}"
    else
      @page_title = t('title.home')
    end
    @meta_keywords = keywords
    @meta_description = desc
  end
  
  def read_book(book)
    if session[:page]
      #是否换了书
      if current_page.book_id == book.id
        @page = current_page
      else
        @page = BookPage.where(["book_id = ?",book.id]).first
        book_init(book,@page)
      end
    else
      @page = BookPage.where(["book_id = ?",book.id]).first
      book_init(book,@page)
    end
  end
  
  def current_user?  
      return session[:email]
  end
  
  def user_name
    user_name = session[:nickname]
  end
  
  def user_email
    user_email = session[:email]
  end
  
  def user_homepage
    user_homepage = session[:homepage]
  end
  #sina weibo function
  def get_oauth
    @oauth = Weibo::OAuth.new(Weibo::Config.api_key, Weibo::Config.api_secret)
    return @oauth
  end
  
  def sina_login 
        get_oauth
        @oauth.authorize_from_request(session[:rtoken], session[:rsecret], params[:oauth_verifier])
        session[:rtoken], session[:rsecret] = nil, nil
        session[:atoken], session[:asecret] = @oauth.access_token.token, @oauth.access_token.secret
        @oauth.authorize_from_access(session[:atoken], session[:asecret])
        @sina_user = Weibo::Base.new(@oauth).user_timeline
        @uid = @sina_user.first.user.id
        @nickname = @sina_user.first.user.screen_name
        @homepage = "http://t.sina.com.cn/#{@uid}"
        @email = "#{@uid}@sina.com"
        session[:head_image] = @sina_user.first.user.profile_image_url
        update_user(@nickname,@email,"sina",@uid,@homepage)
        set_current_user(@nickname,@email,@homepage)
  end
  
  def send_tweet(message)
      get_oauth
      @oauth.authorize_from_access(session[:atoken], session[:asecret])    
      sina_message = strip_tags(message).slice(0,138) 
      Weibo::Base.new(@oauth).delay.update(sina_message)
  end
  
  def sina_logout
    if session[:atoken]
      get_oauth
      @oauth.authorize_from_access(session[:atoken], session[:asecret])
      @sina_user = Weibo::Base.new(@oauth).end_session
      session[:atoken], session[:asecret] = nil,nil
      session[:head_image] = nil
    end
  end
  
  def store_location
    session[:return_to] = nil
    session[:return_to] = request.referrer
  end
  
  def book_init(book,page)  
      set_current_page(page)
      session[:book] = nil
      session[:book] = book.id
      session[:page_count] = nil
      session[:page_count] = BookPage.where(["book_id = ?",book.id]).count
  end
  
  private
  def update_user(nickname,email,provider,uid,homepage)
     @user = User.find_by_email(email)
     if @user
       unless @user.uid != nil
         @user.update_attributes(:provider => provider,:uid => uid)
       end
     else
       User.create(:nickname => nickname,
                  :email => email,
                  :provider => provider,
                  :uid => uid,
                  :homepage => homepage)
     end
   end
end
