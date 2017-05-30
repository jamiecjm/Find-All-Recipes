class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
    	t.integer	:recipe_id
    	t.integer	:user_id
      t.timestamps
    end

    add_index :favourites, [:recipe_id,:user_id]
  end
end
