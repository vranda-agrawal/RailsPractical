class ShopproductsController < ApplicationController
  def display_all_products
    
  end

  def index
    @products = Shopproduct.all
  end

  def show
    @products= Shopproduct.find(params['id'])
  end

  def new
    @product = Shopproduct.new
  end

  def edit
    @product= Shopproduct.find(params['id'])
  end

  def create
    @product = Shopproduct.create(product_params)
    if @product.valid?
      redirect_to '/shopproducts'
    else 
      redirect_to '/shopproducts/new'
    end
    
  end
  
  def update
    @product = Shopproduct.find(params[:id])
    @product.update(product_params)
    redirect_to shopproducts_path
  end

  def display_all_products_default

  end
  
  def product_params
    params.require(:shopproduct).permit(:title,:description,:price,:capacity,:is_active,:status)
  end
  
  def destroy
    @product = Shopproduct.find(params[:id])
    @product.destroy
    redirect_to '/shopproducts'
  end
    
end
