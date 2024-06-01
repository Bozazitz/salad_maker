class Display
  def self.show_evaluation(game)
    puts "Standard Perfect Salad Stats:"
    puts "Total Stats: #{game.standard_perfect_salad[:total_stats]}"
    puts "Total Micronutrients: #{game.standard_perfect_salad[:total_micronutrients]}"
    puts "-" * 30
    puts "Your Salad Stats:"
    puts "Total Stats: #{game.dish.total_stats}"
    puts "Total Micronutrients: #{game.dish.total_micronutrients}"
    puts "-" * 30
    puts "Evaluation:"
    evaluation = game.evaluate_dish
    evaluation.each do |key, value|
      if value > 0
        puts "#{key.capitalize}: Above standard by #{value}"
      elsif value < 0
        puts "#{key.capitalize}: Below standard by #{value.abs}"
      else
        puts "#{key.capitalize}: Matches the standard"
      end
    end
  end
end