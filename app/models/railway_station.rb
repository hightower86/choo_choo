class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
  has_many :trains, foreign_key: :current_station_id
  
  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position") }

  def update_position(route, position)
    rsr = railway_stations_routes.where(route: route).first
    rsr.update(position: position) if rsr
  end

  protected

  def station_route(route)
    @rsr ||= railway_stations_routes.where(route: route).first
  end
end
