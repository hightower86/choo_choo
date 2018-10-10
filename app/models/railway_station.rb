class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
  has_many :trains, foreign_key: :current_station_id
  
  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    rsr = station_route(route)
    rsr.update(position: position) if rsr
  end

  def update_departure(route, d_time)
    rsr = station_route(route)
    rsr.update(departure: d_time) if rsr
  end

  def update_arrive(route, d_time)
    rsr = station_route(route)
    rsr.update(arrival: d_time) if rsr
  end


  def position_in(route)
    station_route(route).try(:position)
  end

  def departure_in(route)
    station_route(route).try(:departure).try(:strftime, "%H:%M")
  end

  def arrive_in(route)
    station_route(route).try(:arrival).try(:strftime, "%H:%M")
  end

  protected

  def station_route(route)
    @rsr = railway_stations_routes.where(route: route).first
  end

end
