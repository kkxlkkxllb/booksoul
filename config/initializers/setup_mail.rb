ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :enable_starttls_auto => true,
  :port                 => 587,
  :domain               => "booksoul.heartme.info", 
  :authentication       => :plain,
  :user_name            => "booksoul.heartme",
  :password             => "kkxlkkxllb225"
}
ActionMailer::Base.default_url_options[:host] = "localhost:3000"