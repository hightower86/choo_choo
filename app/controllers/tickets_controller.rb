class TicketsController < ApplicationController
  before_action :find_ticket, only: [:show, :destroy]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new(ticket_params)
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: "Билет удален"
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id,:end_station_id, :pass, :fio, :user_id)
  end

  def find_ticket
    @ticket = Ticket.find(params[:id]) if params[:id]
  end
end