class Admin::UsersController < Admin::ResourcesController
  
  def follow
    @followid = User.find(params[:id]).uid 
    if session[:atoken]
      @oauth = Weibo::OAuth.new(Weibo::Config.api_key, Weibo::Config.api_secret)
      @oauth.authorize_from_access(session[:atoken], session[:asecret])
      @sina_user = Weibo::Base.new(@oauth).friendship_create(@followid)
      if @sina_user
        flash[:notice] = "Followed Success!#{@sina_user.name}"
        redirect_to "/admin/users"
      else
        flash[:notice] = "Can't Follow again!"
        redirect_to "/admin/users"
      end
    else
      flash[:notice] = "You have not Login with sina!"
      redirect_to "/admin/users"
    end
  end
end
