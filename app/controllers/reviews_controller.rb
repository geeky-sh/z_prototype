class ReviewsController < ApplicationController
  def create
    restaurant_id = params[:restaurant_id]
    content = params[:review][:content]
    rating = params[:review][:rating]
    name = params[:review][:name]

    @review = Restaurant.find(restaurant_id).reviews.create(content: content, rating: rating, name: name)
  end
end
