class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy, :show, :update]

  def index
    @rooms = Room.all

    @rooms = @rooms.where(size: params[:size]) if (params.has_key?(:size) && !params[:size].empty?)
    @rooms = @rooms.where(building: params[:building]) if (params.has_key?(:building) && !params[:building].empty?)
    @rooms = @rooms.where(room_number: params[:room_number]) if (params.has_key?(:room_number) && !params[:room_number].empty?)

  end

  def show
    @booking_history = Reservation.where(room_id: params[:id], member_id: current_member.id)
  end


  def new
    @room = Room.new
  end


  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room
    else
      render :edit
    end
  end


  def edit

    @room = Room.find(params[:id])
  end

  def destroy
    Reservation.where(room_id: params[:id]).destroy_all

    @room.destroy
    redirect_to action: 'index', notice: 'Successfully Deleted'

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:room_number, :building, :size)
  end

end
