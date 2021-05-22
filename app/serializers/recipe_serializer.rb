class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :directions, :image, :user_id, :category_id
end
