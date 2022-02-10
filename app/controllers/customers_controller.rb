class CustomersController < ApplicationController

  def home
  end
    def index
    @customers = Customer.all
  end

  def show
    @customer= Customer.find(params['id'])
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params['id'])
  end

  def create
    puts("=----------------------------------------------------------------------------------")
    puts(params)
    @customer = Customer.create(customer_params)
    if @customer.valid?
      redirect_to '/customers'
    else 
      redirect_to '/customers/new'
    end
    
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def customer_params
    params.require(:customer).permit(:fname,:lname,:email,:phone_number)
  end
  
  def destroy
    puts"========================destroy=================================="
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to '/customer'
  end

  def most_sales_product_by_quantity
    @quantity_list=Order.select("customer_id,sum(quantity) as Sum_of_Total_Quantity").group("customer_id").order(Sum_of_Total_Quantity: :desc).first(3)
  
  end

  def most_sales_product_by_price
    @price_list=Order.select("customer_id,sum(total_price) as Sum_of_Total_Price").group("customer_id").order(Sum_of_Total_Price: :desc).first(3)
  end

  def most_booked_order_of_product

  end

  def most_cancelled_order_of_product

  end
    
end
