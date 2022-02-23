class FoodOrdersController < ApplicationController
  before_action :get_product,except: [:index]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = FoodOrder.all
  end

  def show
  end

  def new
    @order = @product.food_orders.build
  end

  def edit
    puts"======================================================================================"
    puts params
  end

  def create
    @order = @product.food_orders.build(order_params)
    puts @order.food_product.id
    if @order.save
      redirect_to '/food_orders'
    else 
      redirect_to '/food_orders/new'
    end
  end
  
  def update
    @order.update(order_params)
    puts @order.food_product.id
    redirect_to food_orders_path
  end

  def order_params
    params.require(:food_order).permit(:food_product_id,:quantity)
  end
  
  def destroy
    @order.destroy
    redirect_to '/food_orders'
  end

  private
  def get_product
    puts"=============================get_product====================================="
    @product=FoodProduct.find(params['food_product_id'])
  end

  def set_order
    puts"=============================set_order====================================="
    @order=@product.food_orders.find(params['id'])
  end
end
