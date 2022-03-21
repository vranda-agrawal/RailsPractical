require "test_helper"

class FoodProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = MyUser.new(email: "xyz@123",role: "admin",password: "vranda@123")
    @user.save
    @product = @user.food_products.new(name: "computer", description: "testing", price: "600")
    @product.save
  end
  
  setup do
    get '/my_users/sign_in'
    sign_in my_users(:my_user_001)
    post my_user_session_url
  end

  test "should get index" do
    get food_products_path
    assert_response :success
  end

  test "should get new" do
    sign_in my_users(:my_user_001)
    get '/food_products/new'
    assert_response :success
  end

  test "should create Food Product" do
    assert_difference('FoodProduct.count') do
      post food_products_path,params: {food_product:{name:"xyz",description:"abcdfjgjjdfgjgfd",price:200.0,my_user_id:@user.id}}
    end
    assert_redirected_to food_products_path
  end

  test "should get edit" do
    get edit_food_product_path(@product.id) 
    assert_response :success
  end

  test "should update Food Product" do
    patch "/food_products/#{@product.id}" ,params: {food_product:{name:"changed title",description:"abcdfjgjjdfgjgfd"}}
    assert_equal "changed title", FoodProduct.find(@product.id).name
    assert_redirected_to food_products_path
  end

  test "should delete food Product" do
    delete "/food_products/#{@product.id}"
    assert_nil FoodProduct.find_by(id: @product.id)
    assert_redirected_to food_products_path
  end

  test "should get show page" do
    get "/food_products/#{@product.id}"
    assert_response :success
  end
end
