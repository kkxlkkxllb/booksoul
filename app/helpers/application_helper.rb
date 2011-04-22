module ApplicationHelper
  def current_page(con,name)
    if controller_name == con and action_name == "index"
      raw("<li class = 'current'>#{name}</li>")
    else
      link_to "/#{con}" do
        raw("<li class = 'link'>#{name}</li>")
      end
    end
  end
  #ajax request link
  def go_to(title,url)
    link_to title,url,:remote => true
  end
  #友情链接
  def friend_to(title,url)
    link_to url,:target => '_blank',:class=>'text_center' do
      raw("<li>#{title}</li>")
    end
  end


  def current_user?
    return session[:email]
  end

  def user_name
    user_name = session[:nickname]
  end
  #new window link
  def open_to(name,url)
    link_to name,url,:target => '_blank'
  end
  #头像
  def grava(user)
    open_to image_tag(user.gravatar_url,:title => t('user.getimage')),"http://en.gravatar.com/"
  end

  def get_name(name,homepage)
    if homepage.empty?
      "#{name}"
    else
      open_to("#{name}",homepage)
    end
  end
end
