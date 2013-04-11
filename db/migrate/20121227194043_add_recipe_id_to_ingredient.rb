class AddRecipeIdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipe_id, :integer
    add_column :ingredients, :quantity, :integer
    add_column :ingredients, :unit, :string
  end
end
