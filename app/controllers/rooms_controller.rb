class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy, :show]

  def index
    @rooms = Room.all
  end

  def show
    @booking_history = Reservation.where(room: params[:id])

  end

  def destroy
    @room.destroy
    redirect_to action: 'index', notice:'Successfully Deleted'

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

end
