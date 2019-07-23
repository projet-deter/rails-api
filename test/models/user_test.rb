require 'test_helper'

class UserTest < ActiveSupport::TestCase
  email = 'tony@stark.com'
  password = 'azerty'
  name = 'Tony Stark'

  # ALL FIELDS
  test "Should not save user without fields" do
    user = User.new
    assert_not user.save, "Saved the user without fields"
  end

  # EMAIL
  test "Should not save user without email" do
    user = User.new(password: password, name: name)
    assert_not user.save, "Saved the user without an email"
  end

  test "Should not save user with empty email" do
    user = User.new(email: '', password: password, name: name)
    assert_not user.save, "Saved the user with an empty email"
  end

  # test "Should not save user without uniqueness email" do
  #   post = User.new(email: email)
  #   post.save
  #   get = User.find_by(email: email)
  #   if get ?
  #     user = User.new(email: email)
  #     assert_not user.save, "Saved the user without an uniqueness email"
  # end

  # PASSWORD
  test "Should not save user without password" do
    user = User.new(email: email, name: name)
    assert_not user.save, "Saved the user without a password"
  end

  test "Should not save user with an empty password" do
    user = User.new(email: email, password: '', name: name)
    assert_not user.save, "Saved the user with an empty password"
  end

  # test "Should not save user with an unsecure password" do
  #   user = User.new(email: email, password: '12345', name: name)
  #   assert_not user.save, "Saved the user with an unsecure password"
  # end

  # NAME
  test "Should not save user without name" do
    user = User.new(email: email, password: password)
    assert_not user.save, "Saved the user without a name"
  end

  test "Should not save user with an empty name" do
    user = User.new(email: email, password: password, name: '')
    assert_not user.save, "Saved the user with an empty name"
  end
end
