class Recipe < ActiveRecord::Base
  before_save :default_values

  has_many :ingredients
  belongs_to :type
  belongs_to :user
  accepts_nested_attributes_for :ingredients, :allow_destroy => true

  delegate :url, to: :picture, allow_nil: true

  attr_accessible :description, :name, :preparation, :ingredients_attributes, :picture, :duration, :type_id, :user_id, :servings, :url, :picture, :origin
  validates_presence_of :name, :description, :preparation, :type

  has_attached_file :picture, :styles => {
    :banner => "670x195#",
    :medium => "500x500>",
    :thumb => "100x100>",
    :default_url => '/assets/missing.png'
  }

  opinio_subjectum

  def default_values
    self.servings ||= 1
  end

  def similar_recipes
    @ingredientnames ||= Array.new
    self.ingredients.each do |ingredient|
      @ingredientnames << "'" + Regexp.quote(ingredient.name) + "'"
    end
    ingredientlist = @ingredientnames.join(",")
    ingredientlist.gsub("(", "")
    ingredientlist.gsub(")", "")
    sql = "select *, count(recipe_id) as ingredient_count from ingredients inner join recipes on recipes.id = ingredients.recipe_id where ingredients.name in (INGREDIENT_LIST) and ingredients.recipe_id != (SELF_RECIPE_ID) group by recipe_id order by ingredient_count desc limit 5"
    sql["INGREDIENT_LIST"] = ingredientlist
    sql["SELF_RECIPE_ID"] = self.id.to_s()
    Recipe.find_by_sql sql
  end

end
