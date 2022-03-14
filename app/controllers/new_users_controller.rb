class NewUsersController < ApplicationController
  def index
		@users=NewUser.all
	end

	def new
		@user=NewUser.new
	end

	def create
		puts "------------------------------------------------------------"
		@user=NewUser.create(user_params)
		if request.xhr?
			puts "8888888888888888"
		end
		if @user.valid?
			puts "----------------------------------data succesfully saved-----------------------------------------------"
			redirect_to new_users_path
    else 
			puts @new_users.errors.full_messages
      flash[:alert] = @new_users.errors.full_messages
      redirect_to new_users_path
		end
	end

	def user_profile

	end
	
	def show
		@user=NewUser.find(params[:id])
		puts @user

	end

	def destroy
		@user=NewUser.find(params[:id])
		@user.destroy
		redirect_to new_users_path
	end
	
	private
	def user_params
		params.require(:new_user).permit(:first_name,:last_name,:email,:subscription,:subscription_email)
	end
end
