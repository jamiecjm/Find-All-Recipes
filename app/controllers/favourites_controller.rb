class FavouritesController < ApplicationController

	before_action :login_required, only: :index
	

	def new
		respond_to do |format|
			if signed_in?
				@favourite = Favourite.new(user_id: params[:user], recipe_id: params[:recipe])
				@recipe = Recipe.find(params[:recipe])
				if @favourite.save
					@recipe.update(total_favourites: @recipe.total_favourites+=1)
					format.js 
				else
					@favourite = Favourite.find_by(user_id: params[:user], recipe_id: params[:recipe])
					@favourite.destroy
					@recipe.update(total_favourites: @recipe.favourites.count)
					format.js
				end
			else
				flash[:info] = "Please sign in"
				format.js
			end
		end
	end

	def index
		@user = @current_user
		ids = @user.favourites.pluck(:recipe_id)
		@recipes = Recipe.where('id' => ids).includes(:user, :favourites).page params[:page]
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
