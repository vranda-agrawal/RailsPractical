require "test_helper"

class FoodProductTest < ActiveSupport::TestCase
  def setup
    @my_user=MyUser.new(email:'vranda@gmail.com',password:'Vranda@123',role:1)
    @my_user.save
    @food_product = @my_user.food_products.create(name:'vranda',description:'tetsing',price:200.0)
  end

  test "should be valid" do
    assert(@food_product.valid?,@food_product.errors.full_messages)
  end

  test "Name should not be empty" do
    @food_product.name=" "
    assert( @food_product.valid?, "Food Product was saved with a blank name")
  end

  test "Description should not be empty" do
    @food_product.description = " "
    assert( @food_product.valid?, "Food Product was saved with a blank description")
  end

  test "Price should not be empty" do
    @food_product.price = " "
    assert( @food_product.valid?, "Food Product was saved with a blank price")
  end

  test "User id must not be empty" do
    @food_product.my_user_id = nil
    assert( @food_product.valid?, "Food Product was saved with a blank user id")  
  end
end
