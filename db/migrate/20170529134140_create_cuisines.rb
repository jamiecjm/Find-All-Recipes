class CreateCuisines < ActiveRecord::Migration[5.0]
  def change
    create_table :cuisines do |t|
    	t.string	:name
      t.timestamps
    end

    add_column :recipes, :cuisine_id, :integer
    add_column :recipes, :main_ingredient_id, :integer
    remove_column	:recipes, :cuisine
    remove_column	:recipes, :main_ingredient
    add_index :recipes, :cuisine_id
    add_index :recipes, :main_ingredient_id
  end
end
