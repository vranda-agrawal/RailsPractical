class User001sController < ApplicationController
  def index
    @user = User001.all
  end

def show
  @user= User001.find(params['id'])
end

def new
  @user = User001.new
  @user.picture = params[:picture]
end

def create
  @user=User001.create(user_params)
  if @user.valid?
    User001Mailer.user_create_mail(@user).deliver_later
    redirect_to '/user001s'
  else 
    flash[:errors] = @user.errors.full_messages
    redirect_to new_user001_path
  end
end

def edit
  puts params
  @user= User001.find(params['id'])
end

def update
@user = User001.find(params[:id])
@user.update(user_params)
  if @user.valid?
    puts @user.changed
    redirect_to '/user001s'
  else 
    flash[:errors] = @user.errors.full_messages
    redirect_to edit_user001_path
  end
end

def destroy
  @user = User001.find(params[:id])
  @user.destroy
  redirect_to '/user001s'
end

private

def user_params
  params.require(:user001).permit(:name,:email,:picture)
end

end
