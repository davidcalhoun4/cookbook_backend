class CategoriesController < ApplicationController
  def index
    render json: {message: "this thing on?"}
  end
end
