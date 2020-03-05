require 'open-uri'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
buffer = open(url).read
result = JSON.parse(buffer)
result["drinks"].each do |element|
  Ingredient.create(name: element["strIngredient1"])
end

puts "all good!"
