class CreateMainIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :main_ingredients do |t|
    	t.string	:name
      t.timestamps
    end
  end
end
