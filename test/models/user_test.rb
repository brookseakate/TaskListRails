require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Can create a user" do
    assert_difference('User.count', 1) do
      User.create(name: "Nina", email: "nina@nein.com", provider: "alhub", uid: 12348)
    end
  end

  test "Cannot create a user without an email address" do
    user = users(:one)
    user.email = nil

    assert_no_difference('User.count') do
      user.save
    end
  end

  test "Cannot create a user without a uid" do
    user = users(:one)
    user.uid = nil

    assert_no_difference('User.count') do
      user.save
    end
  end

  test "Cannot create a user without a provider" do
    user = users(:one)
    user.provider = nil

    assert_no_difference('User.count') do
      user.save
    end
  end
end
