# Load the rails application
require File.expand_path('../application', __FILE__)
require 'email_format_validator'
# Initialize the rails application
BookSoul::Application.initialize!
Weibo::Config.api_key = "2419359407"
Weibo::Config.api_secret = "e3da528b450aae9e7a0ed2c6cfd2155d"