class FavouritesController < ApplicationController

	def new
		@favourite = Favourite.new(user_id: params[:user], recipe_id: params[:recipe])
		@recipe = Recipe.find(params[:recipe])
		respond_to do |format|
			if @favourite.save
				format.js 
			else
				@favourite = Favourite.find_by(user_id: params[:user], recipe_id: params[:recipe])
				@favourite.destroy
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
