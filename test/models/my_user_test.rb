require "test_helper"

class MyUserTest < ActiveSupport::TestCase
  def setup
    @my_user=MyUser.new(email:'vranda@gmail.com',password:'Vranda@123',role:1)
  end

  test "should be valid" do
    assert(@my_user.valid?,@my_user.errors.full_messages)
  end

  test "Email should not be empty" do
    @my_user.email=" "
    assert( @my_user.valid?, "Email should not be empty")
  end

  test "password should not be empty" do
    @my_user.password = " "
    assert( @my_user.valid?, "User was saved with a blank password")
  end

  test "Role should not be empty" do
    @my_user.role = 'admin'
    assert( @my_user.valid?, "User was saved with a blank role")
  end

  test "password should be in correct format" do
    @my_user.password = 'admin'
    assert( @my_user.valid?, "User password should be in right format")
  end
  
end
