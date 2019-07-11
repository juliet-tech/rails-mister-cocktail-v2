# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Destroy everything"
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

require 'json'
require 'open-uri'

p "Parsing my api"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_json = JSON.parse(ingredients_serialized)

p "Iterating over my ingredients hash"
ingredients_json["drinks"].each do |ingredient_hash|
  p "Creating #{ingredient_hash["strIngredient1"]}"
    Ingredient.create!(name: ingredient_hash["strIngredient1"])
end

p "finished!"
