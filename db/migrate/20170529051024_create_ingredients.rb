class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
    	t.integer	:recipe_id
    	t.float		:amount
    	t.string	:unit
    	t.string	:ingredient	
      t.timestamps
    end

    add_index :ingredients, [:recipe_id]
  end
end
