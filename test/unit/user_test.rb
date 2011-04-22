require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  nickname   :string(255)     not null
#  email      :string(255)     not null
#  homepage   :string(255)
#  uid        :string(255)
#  provider   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

