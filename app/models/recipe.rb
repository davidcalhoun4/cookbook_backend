class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  def created
    created_at.strftime("%b %e, %l:%M %p")
  end
  def chef
    user.name
  end
  def best_eaten
    category.time_of_day
  end
end
