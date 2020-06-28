class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			go_to_url = session[:intended_url]
			session[:intended_url] = nil
			redirect_to (go_to_url || user), notice: "Welcome back, #{user.name}"
			go_to_url = nil
		else
			flash.now[:alert] = "Invalid email/password combination!"
			render :new
		end
	end

	def destroy
		@id = session[:user_id]
		@user = User.find(@id)
		session[:user_id] = nil
		@id = nil
		redirect_to events_path, notice: "#{@user.name} has logged out."
	end

end
