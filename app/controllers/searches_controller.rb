class SearchesController < ApplicationController
  
  def show
    @end_station   = RailwayStation.find(params[:end_station])
    @start_station = RailwayStation.find(params['start_station'])
    @start_stationt_departure = ""
    @end_station_arrive = ""
    @routes = Search.find_routes(@start_station, @end_station)
    @trains = Search.find_trains(@routes)
  end
  def new
    @stations = RailwayStation.all
  end

  def create

  end

  private
  def search_params
    params.require(:search).permit(:start_station, :end_station)
  end
end