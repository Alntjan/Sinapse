require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a name"
    user = User.new
    assert !user.save
  end
end
