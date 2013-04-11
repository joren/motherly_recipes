class ChangeDataTypeForRecipeQuantity < ActiveRecord::Migration
  def up
    change_table :ingredients do |t|
      t.change :quantity, :float
    end
  end

  def down
    change_table :ingredients do |t|
      t.change :quantity, :integer
    end
  end
end
