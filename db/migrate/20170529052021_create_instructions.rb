class CreateInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :instructions do |t|
    	t.integer	:recipe_id
    	t.integer	:step
    	t.string	:title
    	t.text		:description
    	t.string	:step_photo
      t.timestamps
    end

    add_index :instructions, [:recipe_id]
  end
end
