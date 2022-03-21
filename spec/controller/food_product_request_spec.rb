require 'rails_helper'

RSpec.describe User, type: :request do
  before do
    @user=MyUser.create(email:"vranda@gmail.com",password:'Vranda@123',role:1)
    sign_in @user
    @product = @user.food_products.create(name:"abc",description:"testing",price:200.0)
    @product.save
  end
  
  it "gets all products" do
    get food_products_path
    expect(response).to be_successful
  end

  it "should get show" do
    get food_product_path(@product)
    expect(response).to be_successful
  end

  it "should get new" do
    get new_food_product_path
    expect(response).to be_successful
  end

  it "should get edit" do
    get edit_food_product_path(@product)
    expect(response).to be_successful
  end

  it "should get updated" do
    post food_products_path,:params =>{:food_product => {:name => 'bbb',:description => 'abcd',:price => 200.0,:my_user_id => 1},:id =>1 }
    expect(FoodProduct.find_by(name: "bbb")).not_to be_nil
  end

  it "should get delete" do
    delete "/food_products/#{@product.id}" 
    expect(FoodProduct.find_by(name: "abc")).to be_nil
  end

  it "should create product" do
    post food_products_path,:params =>{:food_product => {:name => 'bbb',:description => 'abcd',:price => 200.0,:my_user_id => 1}}
    #binding.pry
    expect(FoodProduct.find_by(name: "bbb")).not_to be_nil
  end
end 
