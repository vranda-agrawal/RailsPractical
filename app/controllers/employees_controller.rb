class EmployeesController < ApplicationController
  
  def index
    @employees=Employee.all
  end

  def search
    if params[:q].blank?
      return
    else
      email=params[:q]
      @employee=Employee.find_by email: email
      if @employee.blank?
        flash[:errors] = "Data not found"
      else
        flash[:errors]=""
      end  
    end
  end

  def increment
    Employee.find_in_batches(batch_size: 10) do |e|
      e.each do |emp|
      emp.no_of_order=emp.no_of_order+1
      emp.save
      end
    end
    redirect_to employees_path
  end

  def decrement
    Employee.find_in_batches(batch_size: 10) do |e|
      e.each do |emp|
      emp.no_of_order=emp.no_of_order-1
      emp.save
      end
    end
    redirect_to employees_path
  end

  def show
    @employee= Employee.find(params['id'])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee=Employee.create(employee_params)
    if @employee.valid?
      redirect_to '/employees'
    else 
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @employee= Employee.find(params['id'])
  end
  
  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
      if @employee.valid?
        redirect_to '/employees'
      else 
        flash[:errors] = @employee.errors.full_messages
        redirect_to edit_employee_path
      end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to '/employees'
  end

  def queries
  end

  private
  def employee_params
      params.require(:employee).permit(:first_name,:last_name,:email,:age,:no_of_order,:full_time_available,:salary)
  end
end
