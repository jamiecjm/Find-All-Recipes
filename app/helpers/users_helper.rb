module UsersHelper

	def signed_in?
		session[:user_id] != nil
	end

	def current_user
		if signed_in?
			User.find(session[:user_id])
		end
	end

	def sign_in(user)
		session[:user_id] = user.id
	end

	def sign_out
		session[:user_id] = nil
	end
end
