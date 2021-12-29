require 'sinatra'
require 'mongoid'

Mongoid.load! 'mongoid.yml'

class GeolocationData
  field :latitude, type: Double
  field :longitude, type: Double
end

class Recipe
  include Mongoid:Document

  field :author, type: String
  field :details, type: String
  field :blend, type: String
  field :brewing_method, type: String
  field :water_weight, type: Double
  field :coffee_weight, type: Double
  field :location, type: GeolocationData
  field :photo, type: string

  validates :blend, presence: true
  validates :brewing_method, presence: true
  validates :water_weight, presence: true
  validates :location, presence: true

  index({author: 'text'})
end

get '/' do
  'Welcome'
end

