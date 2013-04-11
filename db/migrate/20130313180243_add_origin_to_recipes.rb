class AddOriginToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :origin, :string
  end
end
