class FoodOrdersController < ApplicationController
  before_action :check_user_role,except: [:show_all,:show,:index]
  before_action :get_product,except: [:show_all]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def show_all
    @orders = FoodOrder.all
  end

  def index
    @orders=@product.food_orders
  end

  def show
  end

  def new
    @order = @product.food_orders.build
  end

  def edit
  end

  def create
    @order = @product.food_orders.build(order_params)
    if @order.save
      redirect_to '/food_orders'
    else 
      redirect_to '/food_orders/new'
    end
  end
  
  def update
    @order.update(order_params)
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
    @product=FoodProduct.find(params['food_product_id'])
  end

  def set_order
    @order=@product.food_orders.find(params['id'])
  end

  def check_user_role
    if current_my_user.role=='merchant'
      redirect_to '/home/index'
    end
  end
end
