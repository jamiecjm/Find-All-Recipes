module FavouritesHelper

	def current_user_favourites
		if signed_in?
			current_user.favourites.pluck(:recipe_id)
		end
	end
end
