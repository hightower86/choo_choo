class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
  has_many :trains, foreign_key: :current_station_id
  
  validates :title, presence: true

  # scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }
  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route(route).update(position: position) if rsr
  end


  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @rsr ||= railway_stations_routes.where(route: route).first
  end

end
