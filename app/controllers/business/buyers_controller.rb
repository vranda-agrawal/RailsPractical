class Business::BuyersController < ApplicationController
  before_action :find_customer, only: [:preview, :edit, :update, :delete_customer]

  def index
    @customers = Buyer.all
  end

  def preview
    @customers= Buyer.find(params['id'])
  end

  def new
    @customer = Buyer.new
  end

  def edit
  end

  def create
    @customer = Buyer.create(product_params)
    if @customer.valid?
      redirect_to '/business/buyers'
    else 
      redirect_to '/business/buyers/new'
    end
    
  end
  
  def update
    @customer.update(customer_params)
    redirect_to business_buyers_path
  end

  def customer_params
    params.require(:buyer).permit(:name,:gender)
  end
  
  def delete_customer
    @customer.destroy
    redirect_to '/business/buyers'
  end

  def search
    if params[:q].blank?
      flash[:errors]=""
      return
    else
      name=params[:q]
      @customer=Buyer.where(name:name)
      if @customer.blank?
        flash[:errors] = "Data not found"
      else
        flash[:errors]=""
      end  
    end
  end
  private
  def find_customer
    @customer=Buyer.find(params[:id])
  end
end
