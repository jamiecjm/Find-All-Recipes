class PasswordsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user != nil
			@user.update_column(:reset_password_token, SecureRandom.hex)
			UserMailer.change_password(@user).deliver
			flash[:success] = "Please check your email for more details"
			redirect_to '/'
		else
			flash.now[:danger] = "Email is not in system"
			render "new"
		end
	end

	def edit
		@user = User.find_by(id: params[:user_id], reset_password_token: params[:token])
		if @user != nil
			render 'edit'
		else
			flash[:danger] = "Invalid access"
			redirect_to '/'
		end
	end

	def update
		@user = User.find(params[:user_id])
		if @user.update(update_params)
			flash[:success] = "Password updated"
			sign_in(@user)
			@user.update_column(:reset_password_token, nil)
			redirect_to '/'
		else
			flash.now[:danger] = @user.errors.full_messages.first
			render 'edit'
		end
	end

	private 

	def update_params
		params.permit(:password,:password_confirmation,:used_id)
	end

end
