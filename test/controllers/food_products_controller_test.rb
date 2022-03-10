require "test_helper"

class FoodProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    puts "--------------------------------------------------------------------------------------"
    get '/my_users/sign_in'
    sign_in my_users(:my_user_001)
    post my_user_session_url
    puts "----------------------------------------------------------------------------------------"
  end

  test "should get index" do
    binding.pry
    get food_products_path
    assert_response :success
  end

  test "should get new" do
    binding.pry
    get '/food_products/new'
    assert_response :success
  end

  # test "should create Food Product" do
  #   assert_difference('FoodProduct.count') do
  #     post food_products_path,params: {food_product:{name:"xyz",description:"abc",price:200.0,my_user_id:1}}
  #     assert_response :success
  #   end
  #   assert_redirected_to food_products_path
  # end

end
