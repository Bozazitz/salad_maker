require "./dish.rb"
require "./ingredient.rb"
require "./bowl.rb"
require "./display.rb"

class Game

  def self.start
    bowl = Bowl.new

    puts "Let's start building your salad!"
    puts "Stage 1: Choose your base ingredients. Type 'done' when finished."

    loop do
      puts "Available base ingredients: #{bowl.available_ingredients[:base].map(&:name).join(', ')}"
      choice = gets.chomp
      break if choice.downcase == 'done'
      bowl.add_base_ingredient(choice)
    end

    puts "Stage 2: Choose your protein. Type 'done' when finished."
    loop do
      puts "Available protein ingredients: #{bowl.available_ingredients[:protein].map(&:name).join(', ')}"
      choice = gets.chomp
      break if choice.downcase == 'done'
      bowl.add_protein_ingredient(choice)
    end

    puts "Stage 3: Choose your dressing oil. Type 'done' when finished."
    loop do
      puts "Available dressing oils: #{bowl.available_ingredients[:dressing_oil].map(&:name).join(', ')}"
      choice = gets.chomp
      break if choice.downcase == 'done'
      bowl.add_dressing_oil_ingredient(choice)
    end

    puts "Stage 4: Choose your dressing acid. Type 'done' when finished."
    loop do
      puts "Available dressing acids: #{bowl.available_ingredients[:dressing_acid].map(&:name).join(', ')}"
      choice = gets.chomp
      break if choice.downcase == 'done'
      bowl.add_dressing_acid_ingredient(choice)
    end

    puts "Stage 5: Choose your crunch. Type 'done' when finished."
    loop do
      puts "Available crunch ingredients: #{bowl.available_ingredients[:crunch].map(&:name).join(', ')}"
      choice = gets.chomp
      break if choice.downcase == 'done'
      bowl.add_crunch_ingredient(choice)
    end

    Display.show_evaluation(bowl)
  end
end
# # Example usage:
Game.start

# bowl = bowl.new

# # Stage 1: Base
# bowl.add_base_ingredient("Lettuce")
# bowl.add_base_ingredient("Spinach")

# # Stage 2: Protein
# bowl.add_protein_ingredient("Grilled Chicken")

# # Stage 3: Dressing
# bowl.add_dressing_oil_ingredient("Olive Oil")
# bowl.add_dressing_acid_ingredient("Lemon Juice")

# # Stage 4: Crunch
# bowl.add_crunch_ingredient("Croutons")

# Display.show_evaluation(bowl)

