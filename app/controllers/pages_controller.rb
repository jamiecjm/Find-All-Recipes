class PagesController < ApplicationController

	def index
		@recipes = Recipe.all.includes(:user,favourites: [:user])
		@user = current_user
		@favourites = current_user_favourites
	end
end
