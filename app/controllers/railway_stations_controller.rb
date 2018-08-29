class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_departure, :update_arrive]
  before_action :set_route, only: [:update_position, :update_departure, :update_arrive]


  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update_position 
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_departure
    @railway_station.update_departure(@route, params[:departure])
    redirect_to @route
  end

  def update_arrive
    @railway_station.update_arrive(@route, params[:arrive])
    redirect_to @route  
  end


  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:route_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
