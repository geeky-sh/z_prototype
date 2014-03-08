class Review
  include Mongoid::Document

  embedded_in :restaurant

  #belongs_to :user
  field :name, type: String

  field :rating, type: Integer
  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 10}

  field :content, type: String

  before_save :calculate_overall_rating

  def calculate_overall_rating
    all_ratings = restaurant.reviews.map(&:rating)
    max_ratings = all_ratings.length * 10

    restaurant.overall_rating = all_ratings.inject(&:+).to_f / max_ratings.to_f
    restaurant.save
  end
end
