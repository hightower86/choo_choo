class SearchesController < ApplicationController
  
  def show
    @end_station   = RailwayStation.find(params['end_station'])
    @start_station = RailwayStation.find(params['start_station'])
    @routes = Route.railway_stations.find([@start_station, @end_station])
  end

  def new
    @stations = RailwayStation.all
  end

  private

end