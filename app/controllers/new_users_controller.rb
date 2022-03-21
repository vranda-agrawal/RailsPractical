class NewUsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy user_profile update_profile change_password update_password]

  def index
    @users=NewUser.all
  end

  def new
    @user=NewUser.new
  end

  def create
    @user=NewUser.create(user_params)
    if @user.valid?
      respond_to do |format|
        format.js
      end
    else 
      flash.now[:alert] = @user.errors.full_messages
      redirect_to new_users_path
    end
  end

  def user_profile
  end
  
  def update_profile
    binding.pry
    if @user.update(user_params)
      respond_to do |format|
        format.js
        flash.now[:alert]=["Successfully Updated"]
      end
    else 
      flash.now[:alert] = @user.errors.full_messages
      respond_to do |format|
        format.js
      end
    end
  end

  def change_password
    
  end

  def update_password
    if(@user.password==params[:password])
      binding.pry
      @user.update_attribute(:password,params[:new_password])
      redirect_to new_users_path
    else 
      flash.now[:alert]=["-------Incorrect old password---------"]
      puts flash[:alert]
      render "change_password"
    end
  end

  def show
  end

  def destroy
    @user.destroy

    redirect_to new_users_path
  end

  def check_password 
  end
  
  private

  def set_user
    @user=NewUser.find(params[:id])
  end

  def user_params
    params.require(:new_user).permit(:first_name,:last_name,:email,:subscription,:subscription_email,:password)
  end

end
