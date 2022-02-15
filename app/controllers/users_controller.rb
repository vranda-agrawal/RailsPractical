class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    puts"-------------------------------create-----------------------------------"
    puts params
    user_obj=User.create(user_params)
    if user_obj.valid?
      puts "--------------------------------valid user----------------------------"
      redirect_to new_session_path
    else 
      puts "--------------------------------not valid -------------------------------"
      redirect_to new_users_path
    end
  end

  private
  def user_params
  params.require(:user).permit(:email, :password)
  end

end
