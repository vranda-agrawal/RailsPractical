class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    puts "----------------------------create------------------------"
    puts params
    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      puts"----------------------------session----------------------"
      puts session
      puts session[:user_id]
      redirect_to '/'
    else
      redirect_to sessions_path
    end
  end

  def destroy 
    session.delete :user_id
    redirect_to '/'
  end 
end
