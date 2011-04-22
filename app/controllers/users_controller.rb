class UsersController < ApplicationController
  def create
    provider = params[:provider]
    case provider
    when "sina"
      sina_login
    end  
    redirect_to session[:return_to]
  end
  
  def logout
      sina_logout
      user_logout
      #redirect_to request.referrer
      redirect_to :back
  end
  
  def auth
    user_logout
    store_location
    provider = params[:provider]
    case provider
    when "sina"
      get_oauth
      request_token = @oauth.consumer.get_request_token
      session[:rtoken], session[:rsecret] = request_token.token, request_token.secret
      redirect_to "#{request_token.authorize_url}&oauth_callback=http://#{request.env["HTTP_HOST"]}/auth/sina/callback"
    else
      render :text => "Error"
    end
  end
  
  private
  def user_logout
    session[:nickname] = nil
    session[:email] = nil
    session[:homepage] = nil
  end
end
