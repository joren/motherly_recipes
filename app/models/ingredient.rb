class Ingredient < ActiveRecord::Base
  before_save :set_quantity
  belongs_to :recipe

  attr_accessible :name, :quantity, :unit

  def set_quantity
    self.quantity = self.unit.gsub(',','.').to_f
  end

end
