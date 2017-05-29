class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
    	t.integer	:user_id
    	t.integer	:main_ingredient
    	t.integer	:cuisine
    	t.string	:title
    	t.text		:description
    	t.integer	:servings
    	t.integer	:cooktime1
    	t.integer	:cooktime2
    	t.string	:food_photo
      t.timestamps
    end

    add_index :recipes, [:user_id, :main_ingredient, :cuisine]
  end
end
