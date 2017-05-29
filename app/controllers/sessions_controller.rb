class SessionsController < ApplicationController

	def new
	end

	def create
		if user = User.find_by(email: login_params[:email])
			if user.authenticate(login_params[:password])
				sign_in(user)
				flash[:success] = "Successfully signed in"
				redirect_to '/'
			else
				flash.now[:danger] = "Incorrect password"
				render "sessions/new"
			end
		else
			flash.now[:danger] = "Incorrect email"
			render "sessions/new"
		end
	end

	def destroy
		sign_out
		flash[:success] = "Successfully signed out"
		redirect_to '/'
	end

	private

	def login_params
		params.permit(:email,:password)
	end
end
