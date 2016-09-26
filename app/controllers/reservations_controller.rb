class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
  end
  def roomhistory
        @roomhistory = Reservation.where(room_id: params[:id])
  end
  def memberhistory
        @memberhistory = Reservation.where(user_id: params[:id])
  end
  def create
    if (@reservation[:startdate] > Date.tomorrow + 6.days)||(@reservation[:startdate].past?)
      redirect_to action: 'index', notice: "Your reservations date is out of 7 day range."
    else
      if (@reservation[:endtime] <= @reservation[:starttime] + 2.hours)&&(@reservation[:endtime] > @reservation[:starttime])
        Reservation.where(user: current_user.id).each do |reserved|
          if (reserved[:startdate].future?)||(reserved[:startdate].present? && reserved[:starttime].future?)
            redirect_to action: 'index', notice: "You already have a reservations."
            return
          end
        end
        @reservation=Reservation.new(reservation_params)
        if @reservation.save
          redirect_to action: 'index', notice: "User created successfully."
        else
          redirect_to action: 'index', notice: "Error creating user."
        end
      else
        redirect_to action: 'index', notice: "Your reservation time is not within the 2 hour range"
      end

    end
  end


  def destroy
    if (@reservation[:startdate].future?)||(@reservation[:startdate].present? && @reservation[:endtime].future?)
      @reservation.destroy
      redirect_to action: 'index', notice:'Successfully Deleted'
    else
      redirect_to action: 'index', notice:'Reservations in the past can not be destroyed'
    end
  end

  private

  def reservation_params
    params.require(:reservations).permit(:user_id, :room_id, :date, :time)
  end
end
