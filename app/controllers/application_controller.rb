class ApplicationController < ActionController::Base
	helper_method :current_user
	def current_user
		puts "_---------------------------------checking current user------------------------"
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		puts @current_user
	end

	def require_user
		redirect_to '/sessions/new' unless current_user
	end
end
