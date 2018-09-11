class SearchesController < ApplicationController
  
  def show
    @end_station   = RailwayStation.find(params[:end_station])
    @start_station = RailwayStation.find(params['start_station'])
    @routes = Search.find_routes(@start_station, @end_station)
    @trains = Search.find_trains(@routes)
  end

  def new
    @stations = RailwayStation.all
  end

  def create

  end

  def find_time()
    Search.get_departure_time(route, @start_station)
    redirect_to @search
  end

  private
  def search_params
    params.require(:search).permit(:start_station, :end_station)
  end
end