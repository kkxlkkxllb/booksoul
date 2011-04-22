require 'test_helper'

class BookPageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: book_pages
#
#  id         :integer         not null, primary key
#  num        :integer         not null
#  content    :text            not null
#  book_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

