require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  nickname     :string(255)     not null
#  email        :string(255)     not null
#  homepage     :string(255)
#  content      :text            not null
#  like         :integer         default(0)
#  book_page_id :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

