class AddTypeIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :type_id, :integer
  end
end
