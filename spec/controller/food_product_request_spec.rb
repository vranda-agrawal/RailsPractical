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
    puts "#{@user.email} - #{@product.description}"
  end

  it "should get new" do
    get new_food_product_path
    expect(response).to be_successful
  end

  it "should get edit" do
    get edit_food_product_path(@product)
    expect(response).to be_successful
  end

  it "should get delete" do
    delete "/food_products/#{@product.id}" 
    expect(FoodProduct.find_by(name: "abc")).to be_nil
  end

#   it "should get create" do
#     product_params = FactoryBot.attributes_for(:my_product)
#     post :create, :my_product => product_params
#     expect(response).to be_successful
# end

end 
