require 'rails_helper'

RSpec.describe FoodProduct,type: :model do
  before do
    @my_user=MyUser.new(email:'vrandaa@gmail.com',password:'Vranda@123',role:1)
    @my_user.save
    @food_product = @my_user.food_products.create(name:'vranda',description:'testing',price:200.0)
  end

  it "should be valid" do
    expect(@food_product).to be_valid
  end

  it "Name should not be empty" do
    @food_product.name=" "
    expect(@food_product).to_not be_valid
  end

  it "Description should not be empty" do
    @food_product.description = " "
    expect(@food_product).to_not be_valid
  end

  it "Price should not be empty" do
    @food_product.price = " "
    expect(@food_product).to_not be_valid
  end

  it "User id must not be empty" do
    @food_product.my_user_id = nil
    expect(@food_product).to_not be_valid  
  end

end
