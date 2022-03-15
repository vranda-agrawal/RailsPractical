class NewUsersController < ApplicationController
	before_action :set_user, only: %i[ show edit update destroy user_profile update_profile change_password update_password]

  def index
		@users=NewUser.all
	end

	def new
		@user=NewUser.new
	end

	def create
		puts "------------------------------------------------------------"
		@user=NewUser.create(user_params)
		if @user.valid?
			puts "----------------------------------data succesfully saved-----------------------------------------------"
			redirect_to new_users_path
    else 
			puts @new_users.errors.full_messages
      flash[:alert] = @new_users.errors.full_messages
      redirect_to new_users_path
			#format.js
		end
	end

	def user_profile
	end
	
	def edit 	
	end

	def update_profile
		puts params
		if @user.update(user_params)
			puts "----------------------------------data succesfully updated-----------------------------------------------"
			redirect_to new_users_path
    else 
			puts @user.errors.full_messages
      flash[:alert] = @user.errors.full_messages
      redirect_to update_profile_new_user_path
		end
	end

	def change_password
	
	end

	def update_password
		puts params
		binding.pry
		@user.update(password:params[:new_password])
		binding.pry
	end

	def show
		puts @user
	end

	def destroy
		@user.destroy
		redirect_to new_users_path
	end
	
	private

	def set_user
		@user=NewUser.find(params[:id])
	end

	def user_params
		params.require(:new_user).permit(:first_name,:last_name,:email,:subscription,:subscription_email,:password)
	end

end
