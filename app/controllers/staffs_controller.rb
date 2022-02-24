class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def show
    @staff= Staff.find(params['id'])
  end

  def new
    @staff = Staff.new
    1.times { @staff.employee_addresses.build }
  end

  def create
    @staff=Staff.create(staff_params)
    if @staff.valid?
      redirect_to '/staffs'
    else 
      flash[:errors] = @staff.errors.full_messages
      redirect_to new_staff_path
    end
  end

  def edit
    @staff = Staff.find(params['id'])
  end

  def update
  @staff = Staff.find(params[:id])
  @staff.update(staff_params)
    if @staff.valid?
      redirect_to '/staffs'
    else 
      flash[:errors] = @staff.errors.full_messages
      redirect_to staff_path
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to '/staffs'
  end

  def search
    if params[:q].blank?
      flash[:errors]=""
      return
    else
      name=params[:q]
      @staffs=Staff.where(employee_name: name)
      puts @staffs
      @staffs.each do |s|
        puts s.employee_name
      end
      if @staffs.blank?
        flash[:errors] = "Data not found"
      else
        flash[:errors]=""
      end  
    end
  end

  private
  def staff_params
    params.require(:staff).permit(:employee_name,:email,:password,:gender,{hobbies:[]},:address,:mobile_number,:birth_date,:document, employee_addresses_attributes: [:house_name,:street_name,:road])
  end
end
