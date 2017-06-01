class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:recipes, :total_favourites, 0)
  end
end
