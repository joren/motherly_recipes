class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :preparation

      t.timestamps
    end
  end
end
