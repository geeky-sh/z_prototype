class Review
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :restaurant

  field :name, type: String
  validates :name, presence: true

  field :rating, type: Integer
  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 10}

  field :content, type: String

  before_save :calculate_overall_rating

  def calculate_overall_rating
    all_ratings = restaurant.reviews.map(&:rating)
    restaurant.overall_rating = ((all_ratings.inject(0.0) { |sum, el| sum + el } )/ all_ratings.size)
    restaurant.save
  end
end
