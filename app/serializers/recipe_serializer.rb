class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :directions, :image, :chef, :best_eaten, :created
end
