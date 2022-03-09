require "test_helper"

class FoodProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_products=FoodProduct.all
  end

  test "should get index" do
    get food_products_path
    assert_response :success
  end

end
