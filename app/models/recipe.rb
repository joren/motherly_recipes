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

end
