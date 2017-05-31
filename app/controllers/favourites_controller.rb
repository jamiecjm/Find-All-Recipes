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
		@user = current_user
		ids = @user.favourites.pluck(:recipe_id)
		@recipes = Recipe.where('id' => ids).includes(:user, favourites:[:user])
		@recipes_id = @recipes.pluck(:id)
		@favourites = current_user_favourites
	end

	def fav
		@recipe = Recipe.find(params[:id])
		@favourites = @recipe.favourites.includes(:user)
		respond_to do |format|
			format.js
		end
	end

end
