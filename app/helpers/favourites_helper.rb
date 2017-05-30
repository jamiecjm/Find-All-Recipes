module FavouritesHelper

	def current_user_favourites
		current_user.favourites.pluck(:recipe_id)
	end
end
