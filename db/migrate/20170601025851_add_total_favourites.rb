class AddTotalFavourites < ActiveRecord::Migration[5.0]
  def change
  	add_column :recipes, :total_favourites, :integer
  end
end
