class Ingredient
  attr_accessor :name, :stats, :tags, :micronutrients

  def initialize(name, stats, tags, micronutrients)
    @name = name
    @stats = stats
    @tags = tags
    @micronutrients = micronutrients
  end
end
