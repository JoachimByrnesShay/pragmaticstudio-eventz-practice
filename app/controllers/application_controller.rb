class ApplicationController < ActionController::Base
private
	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) if (session[:user_id])
	end

	helper_method :current_user

	def require_signin
		session[:intended_url] = request.url
		redirect_to signin_path, alert: "Please sign in." unless current_user
	end

	def current_user?(user)
		current_user == user
	end

	helper_method :current_user?

	def require_admin
		redirect_to events_url, alert: "unauthorized access" unless current_user.admin?
	end

	def current_user_admin?
		current_user && current_user.admin?
	end

	helper_method :current_user_admin?

end
