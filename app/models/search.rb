class Search < ApplicationRecord

  def self.find_routes(start_station, end_station)
    # start_station.inspect 
    # first = Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = ?", start_station])
    # finish = Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = ?", end_station])
    first  = self.find_station(start_station)
    finish = self.find_station(end_station)
    routes = first & finish  
  end

  def self.find_station(station)
    Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = ?", station])
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
