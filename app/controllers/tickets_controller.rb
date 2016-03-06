class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :destroy]
  before_action :set_user
  before_action :set_stations, only: [:new, :create]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = @user.tickets.new
  end

  def create
    @ticket = @user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to user_ticket_path(@user, @ticket)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @ticket.update(ticket_params)
  #     redirect_to @ticket
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @ticket.destroy
    redirect_to user_tickets_path(@user)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :start_station_id, :end_station_id, :user_name)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_stations
    @start_station = RailwayStation.find(params[:ticket][:start_station_id])
    @end_station = RailwayStation.find(params[:ticket][:end_station_id])
  end

  def set_train
    @train = Train.find(params[:ticket][:train_id])
  end
end