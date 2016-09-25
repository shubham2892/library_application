class ReservationController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.where(user: current_user.id)
  end
  def create
    if (@reservation[:date] > Date.tomorrow + 6.days)||(@reservation[:date].past?)
      redirect_to action: 'index', notice: "Your reservation date is out of 7 day range."
    else
      Reservation.where(user: current_user.id).each do |reserved|
        if (reserved[:date].future?)||(reserved[:date].present? && reserved[:time].future?)
          redirect_to action: 'index', notice: "You already have a reservation."
          return
        end
      end
      @reservation=Reservation.new(reservation_params)
      if @reservation.save
        redirect_to action: 'index', notice: "User created successfully."
      else
        redirect_to action: 'index', notice: "Error creating user."
      end
    end
  end


  def destroy
    if (@reservation[:date].future?)||(@reservation[:date].present? && @reservation[:time].future?)
      @reservation.destroy
      redirect_to action: 'index', notice:'Successfully Deleted'
    else
      redirect_to action: 'index', notice:'Reservations in the past can not be destroyed'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id,:room_id,:date,:time)
  end
end
