class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
  has_many :trains, foreign_key: :current_station_id
  
  validates :title, presence: true
end
