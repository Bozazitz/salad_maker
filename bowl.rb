class Bowl
  attr_accessor :available_ingredients, :dish, :stage, :max_ingredients

  def initialize
    @available_ingredients = load_ingredients
    @dish = Dish.new
    @stage = 1
    @max_ingredients = { base: 5, protein: 4, dressing_oil: 5, dressing_acid: 5, crunch: 6 }
  end

  def load_ingredients
    {
      base: [
        Ingredient.new("Lettuce", { satiety: 2, healthiness: 3, difficulty: 1, taste: 2, cost: 1, popularity: 3 }, ["Green", "Crunchy", "Low Calorie"], { vitamins: 3, minerals: 2, fiber: 2, fat: 0, protein: 1, carbohydrates: 1 }),
        Ingredient.new("Spinach", { satiety: 3, healthiness: 5, difficulty: 2, taste: 3, cost: 2, popularity: 4 }, ["Leafy", "Nutritious", "Green"], { vitamins: 5, minerals: 4, fiber: 3, fat: 0, protein: 2, carbohydrates: 2 }),
        # ... other base ingredients
      ],
      protein: [
        Ingredient.new("Grilled Chicken", { satiety: 6, healthiness: 4, difficulty: 4, taste: 5, cost: 5, popularity: 5 }, ["Protein", "Savory", "White Meat"], { vitamins: 1, minerals: 2, fiber: 0, fat: 3, protein: 8, carbohydrates: 0 }),
        Ingredient.new("Tofu", { satiety: 5, healthiness: 5, difficulty: 3, taste: 3, cost: 3, popularity: 3 }, ["Protein", "Vegetarian", "Soft"], { vitamins: 2, minerals: 2, fiber: 1, fat: 4, protein: 7, carbohydrates: 2 }),
        # ... other protein ingredients
      ],
      dressing_oil: [
        Ingredient.new("Olive Oil", { satiety: 1, healthiness: 4, difficulty: 1, taste: 4, cost: 3, popularity: 4 }, ["Oil", "Healthy", "Rich"], { vitamins: 0, minerals: 0, fiber: 0, fat: 5, protein: 0, carbohydrates: 0 }),
        # ... other oil ingredients
      ],
      dressing_acid: [
        Ingredient.new("Lemon Juice", { satiety: 1, healthiness: 3, difficulty: 1, taste: 5, cost: 2, popularity: 4 }, ["Acid", "Citrusy", "Tangy"], { vitamins: 2, minerals: 1, fiber: 0, fat: 0, protein: 0, carbohydrates: 1 }),
        # ... other acid ingredients
      ],
      crunch: [
        Ingredient.new("Croutons", { satiety: 2, healthiness: 2, difficulty: 2, taste: 4, cost: 2, popularity: 4 }, ["Crunchy", "Savory", "Bread"], { vitamins: 1, minerals: 1, fiber: 1, fat: 2, protein: 1, carbohydrates: 4 }),
        # ... other crunch ingredients
      ]
    }
  end

  def add_base_ingredient(ingredient_name)
    add_ingredient(:base, ingredient_name)
  end

  def add_protein_ingredient(ingredient_name)
    add_ingredient(:protein, ingredient_name)
  end

  def add_dressing_oil_ingredient(ingredient_name)
    add_ingredient(:dressing_oil, ingredient_name)
  end

  def add_dressing_acid_ingredient(ingredient_name)
    add_ingredient(:dressing_acid, ingredient_name)
  end

  def add_crunch_ingredient(ingredient_name)
    add_ingredient(:crunch, ingredient_name)
  end

  def add_ingredient(stage, ingredient_name)
    ingredient = @available_ingredients[stage].find { |ing| ing.name == ingredient_name }
    if ingredient && @dish.ingredients.count { |ing| ing.tags.include?(stage.to_s) } < @max_ingredients[stage]
      @dish.add_ingredient(ingredient)
    end
  end

  def standard_perfect_salad
    {
      ingredients: ["Lettuce", "Spinach", "Grilled Chicken", "Olive Oil", "Lemon Juice", "Croutons"],
      total_stats: { satiety: 15, healthiness: 20, difficulty: 10, taste: 15, cost: 10, popularity: 20 },
      total_micronutrients: { vitamins: 20, minerals: 20, fiber: 15, fat: 10, protein: 20, carbohydrates: 15 }
    }
  end

  def evaluate_dish
    result = {}
    sps = standard_perfect_salad

    @dish.total_stats.each do |stat, value|
      result[stat] = value - sps[:total_stats][stat]
    end

    @dish.total_micronutrients.each do |nutrient, value|
      result[nutrient] = value - sps[:total_micronutrients][nutrient]
    end

    result
  end
end