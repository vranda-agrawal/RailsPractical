class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to user_profile_users_path
    else
      redirect_to sessions_path
    end
  end

  def destroy 
    session.delete :user_id
    redirect_to new_session_path
  end
end
