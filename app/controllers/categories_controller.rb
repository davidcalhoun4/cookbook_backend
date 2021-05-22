class CategoriesController < ApplicationController
  def index
    category = Category.all
    render json: category
  end

  def create
    category = Category.new(
      time_of_day: params[:time_of_day]
    )
    if category.save
      render json: { message: "Category created successfully" }, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :bad_request
    end
  end
end
