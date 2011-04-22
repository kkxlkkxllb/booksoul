BookSoul::Application.routes.draw do

  resources :books  
  
  get 'kindeditor/images_list'
  post 'kindeditor/upload'
  match 'sitemap' => "topics#sitemap"
  #nav
  match 'topics' => "topics#index"
  match 'comments' => "comments#index"
  match 'uploads' => "uploads#index"
  
  match 'new_comment' => "comments#create"
  match 'uploading' => 'uploads#create'
  match 'like/:id' => "comments#like",:as => :like
  match 'logout' => "users#logout"
  match 'tag/:id' => "books#tag", :as => :tag
  match 'rand_read' => "books#rand_read"
  #book_pages
  match "save_bookmark" => "book_pages#save_bookmark"
  match "read_bookmark"=>"book_pages#read_bookmark"
  match "read/:id" => "book_pages#read",:as => :read
  match "jump" => "book_pages#jump"
  match "last_page" => "book_pages#last_page"
  match "next_page" => "book_pages#next_page"
  #topics
  match "aboutus" => "topics#about"
  match "protection" => "topics#protection"
  #omniAuth
  match 'auth/:provider' => "users#auth",:as => :auth
  match '/auth/:provider/callback' => "users#create"
  root :to => "books#index"
  

end
