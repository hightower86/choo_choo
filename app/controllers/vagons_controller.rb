class VagonsController < ApplicationController
  before_action :set_vagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

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
    @vagon = @train.vagons.new(vagon_params)
    
    if @vagon.save
      redirect_to @train
    else
      render :new
    end
  end

  # PATCH/PUT /vagons/1
  def update
    respond_to do |format|
      if @vagon.update(vagon_params)
        format.html { redirect_to @vagon.becomes(Vagon), notice: 'Vagon was successfully updated.' }
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
    def set_train
      @train = Train.find(params[:train_id])
    end
    # Use callbacks to share common setup or consvagonts between actions.
    def set_vagon
      @vagon = Vagon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # тут перечислить все поля подклассов. важно! поле тайп
    def vagon_params 
      params.require(:vagon).permit(:number, :num_low_places, :num_hi_places, :side_hi_places, :side_low_places, :train_id, :type, :seat_places)
    end
end