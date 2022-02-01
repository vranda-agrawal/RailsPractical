class FacultiesController < ApplicationController
  def index
      @faculties = Faculty.all
    end
  
  def show
    @faculty= Faculty.find(params['id'])
  end
  
  def new
    @faculty = Faculty.new
  end

  def create
    @faculty=Faculty.create(faculty_params)
    if @faculty.valid?
      #puts '---------------valid user----------------'
      redirect_to '/faculties'
    else 
      #puts '-----------------not valid-----------------'
      # flash[:errors] = student.errors.full_messages
      #puts @faculty.errors.full_messages
      #puts @faculty.errors.any?
      render 'new'
    end
  end
  
  def edit
  #puts"--------------------------------------------------------"
  @faculty= Faculty.find(params['id'])
  end
  
  def update
  @faculty = Faculty.find(params[:id])
  @faculty.update(faculty_params)
    if @faculty.valid?
      #puts '---------------valid user----------------'
      redirect_to '/faculties'
    else 
      #puts '-----------------not valid-----------------'
      #puts @faculty.errors.full_messages
      #puts @faculty.errors.any?
      render 'edit'
    end
  end

  def destroy
    #puts "============================================================================="
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to '/faculties'
  end

  private
  def faculty_params
      params.require(:faculty).permit(:first_name,:last_name,:DOB,:phone_number,:email,:designation)
  end
end
