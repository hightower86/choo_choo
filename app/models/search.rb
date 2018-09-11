class Search < ApplicationRecord

  def self.find_routes(start_station, end_station)
    start_station.inspect 
    Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = ?", start_station] && ["railway_stations_routes.railway_station_id = ?", end_station])
  end

  def self.find_trains(routes)
    Train.where(route: routes)
  end

  def self.get_departure_time(route, station)
    RailwayStationsRoute.where(route: route, railway_station: station).first.departure.to_s(:time)
  end

  def start_station
    @start_station = RailwayStation.find(params['start_station'])
  end

end
