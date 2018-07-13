class Route < ActiveRecord::Base
  has_and_belongs_to_many :railway_stations
  has_many :trains
	validates :title, presence: true
end