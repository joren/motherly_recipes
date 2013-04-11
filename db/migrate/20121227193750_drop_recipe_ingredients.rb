class DropRecipeIngredients < ActiveRecord::Migration
  def up
    drop_table :recipe_ingredients
  end

  def down
  end
end
