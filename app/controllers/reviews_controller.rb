class ReviewsController < ApplicationController
  def create
    flash[:error] = nil
    restaurant_id = params[:restaurant_id]
    content = params[:review][:content]
    rating = params[:review][:rating].to_i
    name = params[:review][:name]

    @restaurant = Restaurant.find(restaurant_id)
    @review = @restaurant.reviews.create(content: content, rating: rating, name: name)
    flash[:error] = @review.errors.full_messages.join(', ') if !@review.save
  end
end
