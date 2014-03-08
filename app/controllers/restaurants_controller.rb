class RestaurantsController < ApplicationController

  def index
    @locations = Restaurant::CITIES
  end

  def location
    @location = params[:location]

    @all_categories = Restaurant::CATEGORIES
    @categories = Restaurant.where(city: @location).distinct(:categories)
  end

  def category
    @location = params[:location]
    @category = params[:category]

    @restaurants = Restaurant.where(city: @location, categories: @category)
    @categories = Restaurant::CATEGORIES
  end

  def show
    id= params[:id]

    @restaurant = Restaurant.find(id)
  end
end