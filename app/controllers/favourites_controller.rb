class FavouritesController < ApplicationController

	# before_action :login_required, only: :new

	def new
		respond_to do |format|
			if signed_in?
				@favourite = Favourite.new(user_id: params[:user], recipe_id: params[:recipe])
				@recipe = Recipe.find(params[:recipe])
				if @favourite.save
					format.js 
				else
					@favourite = Favourite.find_by(user_id: params[:user], recipe_id: params[:recipe])
					@favourite.destroy
					format.js
				end
			else
				flash[:info] = "Please sign in"
				format.js
			end
		end
	end

	def index
		@favourites = current_user.favourites.includes(recipe: [:user,favourites:[:user]])
		@user = current_user
		@current_user_favourites = current_user_favourites
	end

end
