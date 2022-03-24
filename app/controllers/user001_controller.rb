class User001Controller < ApplicationController
  def index
    @user = User001.all
  end

def show
  @user= User001.find(params['id'])
end

def new
  @user = User001.new
end

def create
  @user=User001.create(faculty_params)
  if @user.valid?
    redirect_to '/user001'
  else 
    flash[:errors] = @user.errors.full_messages
    redirect_to new_user001_path
  end
end

def edit
  @user= User001.find(params['id'])
end

def update
@user = User001.find(params[:id])
@user.update(faculty_params)
  if @user.valid?
    redirect_to '/user001'
  else 
    flash[:errors] = @user.errors.full_messages
    redirect_to edit_user001_path
  end
end

def destroy
  @user = User001.find(params[:id])
  @user.destroy
  redirect_to '/faculties'
end

private
def faculty_params
    params.require(:faculty).permit(:first_name,:last_name,:DOB,:phone_number,:email,:designation)
end
end
