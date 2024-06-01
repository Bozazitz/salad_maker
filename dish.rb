class Dish
  attr_accessor :ingredients

  def initialize
    @ingredients = []
  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end

  def total_stats
    stats = { satiety: 0, healthiness: 0, difficulty: 0, taste: 0, cost: 0, popularity: 0 }
    @ingredients.each do |ingredient|
      ingredient.stats.each do |key, value|
        stats[key] += value
      end
    end
    stats
  end

  def total_micronutrients
    micronutrients = { vitamins: 0, minerals: 0, fiber: 0, fat: 0, protein: 0, carbohydrates: 0 }
    @ingredients.each do |ingredient|
      ingredient.micronutrients.each do |key, value|
        micronutrients[key] += value
      end
    end
    micronutrients
  end
end