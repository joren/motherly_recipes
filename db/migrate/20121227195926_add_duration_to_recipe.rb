class AddDurationToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :duration, :integer
  end
end
