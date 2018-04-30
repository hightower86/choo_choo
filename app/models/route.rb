class Route < ActiveRecord::Base
  has_many: :railway_station_routes
  has_many: :railwaystations, through: :railway_station_routes 
	validates :title, presence: true
end