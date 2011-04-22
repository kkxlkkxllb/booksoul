require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: uploads
#
#  id                :integer         not null, primary key
#  title             :string(255)     not null
#  book_file_name    :string(255)
#  book_content_type :string(255)
#  book_file_size    :integer
#  book_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

