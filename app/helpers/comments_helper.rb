module CommentsHelper

   def user_email
     user_email = session[:email]
   end

   def user_homepage
     user_homepage = session[:homepage]
   end
   
   def head_image_url
     if session[:head_image]
       head_image_url = session[:head_image]
     else
       Comment.find_by_email(user_email).gravatar_url(:size => 40, :secure => true)
     end
   end
   
   def like_to(n,obj)
     link_to n,like_path(obj),:remote => true,:onclick=>"$('#num_#{obj.id}').click();
                                                        $('#liked_#{obj.id}').show('pulsate');
                                                        $('#like_#{obj.id}').addClass('hidden');"
   end
   
   def label_on(obj)
     label_tag nil,"#{obj.like}#{t('comment.saylike')}",:id=>"num_#{obj.id}",
                                    :onclick => "this.innerText='#{obj.like+1}#{t('comment.saylike')}';"
   end
   
   def comment_time(obj)
     "#{t('comment.time')}#{obj.created_at.strftime('%Y/%m/%d at %H:%M:%S')}"
   end
   
   def reply_to(obj)
      link_to t('comment.say'),"#chat_new",:onclick => "KE.html('chat', '');KE.insertHtml('chat', '@#{obj}:')"
   end
end
