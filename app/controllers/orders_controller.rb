class OrdersController < ApplicationController
    def index
    @orders = Order.all
  end

  def show
    @orders= Order.find(params['id'])
  end

  def new
    @order = Order.new
  end

  def edit
    @order= Order.find(params['id'])
  end

  def create
    @order = Order.create!(order_params)
    if @order.valid?
      redirect_to '/orders'
    else 
      redirect_to '/orders/new'
    end
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_path
  end

  def search
    if params[:q].blank?
      flash[:errors]=""
      return
    else
      product_id=params[:q][:shopproduct_id]
      @orders=Order.where(shopproduct_id:product_id)
      if @orders.blank?
      flash[:errors] = "Data not found"
      else
      flash[:errors]=""
      end  
    end
    end

  def order_params
    params.require(:order).permit(:quantity,:shopproduct_id,:status,:customer_id)
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to '/orders'
  end
  
  def filter_data
    if params[:type].blank?
      return
    else
      puts params
      if params[:type]=='booked'
        @order=Order.where("status=?",'0')
        
      else
        @order=Order.where("status=?",'1')
      end
    end
  end
  
end
