class UsersController < ApplicationController
  before_action :require_user, only: [:user_profile]
  def new
    @user = User.new
  end

  def create
    user_obj=User.create(user_params)
    if user_obj.valid?
      if params[:user][:address] !=""
        address=Address.create(user_id: user_obj.id,fulladdress: params[:user][:address])
      else
        puts "address is blank"
      end
      redirect_to new_session_path
    else 
      redirect_to new_users_path
    end
    
  end

  def user_profile
    @user=User.find(session[:user_id])
    @enrolled_events=@user.enrols
    @enrolled_events.each do |e|
    puts e
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username,:email, :password)
  end

end
