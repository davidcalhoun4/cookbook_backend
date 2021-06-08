class RecipesController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  
  def index
    render json: Recipe.all
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe
  end

  def create
    @recipe = Recipe.new(
      name: params[:name],
      ingredients: params[:ingredients],
      directions: params[:directions],
      image: params[:image],
      user_id: current_user.id,
      category_id: params[:category_id]
    )
    if @recipe.save
      render json: @recipe 
    else
      render json: @recipe.errors.full_messages, status: 422
    end
  end

  def update
  
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.user_id == current_user.id
      @recipe.name = params[:name] || @recipe.name
      @recipe.ingredients = params[:ingredients] || @recipe.ingredients
      @recipe.directions = params[:directions] || @recipe.directions
      @recipe.image = params[:image] || @recipe.image
      @recipe.category_id = params[:category_id] || @recipe.category_id
      if @recipe.save
        render json: @recipe
      else
        render json: @recipe.erros.full_messages, status: 422
      end
    else 
      render json: { errors: "you are not authorized to update this recipe" }, status: :unauthorized 
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.user_id == current_user.id
      if @recipe.destroy
        render json: {message: "Recipe ~#{@recipe.name}~ destroyed." }
      else
        render json: {message: "Recipe ~#{@recipe.name}~ not destroyed."}
      end
    else
      render json: { errors: "you are not authorized to delete this recipe" }, status: :unauthorized
    end
  end

end
