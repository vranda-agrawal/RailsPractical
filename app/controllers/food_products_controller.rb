class FoodProductsController < ApplicationController
  def index
    @products = FoodProduct.all
  end

  def show
    @products= FoodProduct.find(params['id'])
  end

  def new
    @product = FoodProduct.new
  end

  def edit
    @product= FoodProduct.find(params['id'])
  end

  def create
    @product = FoodProduct.create(product_params)
    if @product.valid?
      redirect_to '/food_products'
    else 
      redirect_to '/food_products/new'
    end
    
  end
  
  def update
    @product = FoodProduct.find(params[:id])
    @product.update(product_params)
    redirect_to food_products_path
  end

  def product_params
    params.require(:food_product).permit(:name,:description,:price)
  end
  
  def destroy
    @product = FoodProduct.find(params[:id])
    @product.destroy
    redirect_to '/food_products'
  end
end
