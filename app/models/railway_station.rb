class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :tickets
  has_many :trains, foreign_key: :current_station_id
  
  validates :title, presence: true
end
