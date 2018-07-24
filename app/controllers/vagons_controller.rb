class VagonsController < ApplicationController
  before_action :set_vagon, only: [:show, :edit, :update, :destroy]

  # GET /vagons
  def index
    @vagons = Vagon.all
  end

  # GET /vagons/1
  def show
  end

  # GET /vagons/new
  def new
    @vagon = Vagon.new
  end

  # GET /vagons/1/edit
  def edit
  end

  # POST /vagons
  def create
    @vagon = Vagon.new(vagon_params)

    respond_to do |format|
      if @vagon.save
        format.html { redirect_to @vagon, notice: 'Vagon was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /vagons/1
  def update
    respond_to do |format|
      if @vagon.update(vagon_params)
        format.html { redirect_to @vagon, notice: 'Vagon was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /vagons/1
  def destroy
    @vagon.destroy
    respond_to do |format|
      format.html { redirect_to vagons_url, notice: 'Vagon was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or consvagonts between actions.
    def set_vagon
      @vagon = Vagon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vagon_params
      params.require(:vagon).permit(:number, :v_type)
    end
end