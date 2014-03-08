class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  NEW_DELHI = 'New Delhi'
  BANGALORE = 'Bangalore'
  AHMEDABAD = 'Ahmedabad'
  MUMBAI = 'Mumbai'
  CITIES = [NEW_DELHI, BANGALORE, AHMEDABAD, MUMBAI]

  C_DINE_OUT = 'Dine-Out'
  C_DELIVERY = 'Delivery'
  C_NIGHT_LIFE = 'Night Life'
  C_CAFES = 'Cafes'
  CATEGORIES = [C_DELIVERY, C_DINE_OUT, C_NIGHT_LIFE, C_CAFES]

  field :name, type: String
  validates :name, presence: true

  field :address, type: String

  embeds_many :reviews

  field :city, type: String
  validates :city, inclusion: {in: CITIES}

  field :categories, type: Array, default: []
  #validates :categories, inclusion: {in: CATEGORIES}, allow_blank: true

  field :overall_rating, type: Float

end
