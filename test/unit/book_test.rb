require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: books
#
#  id                 :integer         not null, primary key
#  title              :string(255)     not null
#  author             :string(255)     not null
#  info               :text            not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

