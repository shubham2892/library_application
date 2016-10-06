class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def index
    if current_member.is_admin
      @reservations = Reservation.all
    else
      @reservations = Reservation.where(member_id: current_member.id)
    end
  end

  def create

    @starttime = params[:reservation][:starttime]
    @starttime = @starttime.to_datetime
    @endtime = @starttime + 2.hours
    @startdate = @starttime.to_date

    if (@startdate> Date.tomorrow + 6.days)|| (@startdate.past?)
      redirect_to action: 'index', notice: "Your reservations date is out of 7 day range."
    else
      Reservation.where(member_id: current_member.id).each do |reserved|

        if (reserved[:startdate].future? && current_member.is_admin=false)||(reserved[:startdate].present? && reserved[:starttime].future? && current_member.is_admin=false)
          redirect_to action: 'index', notice: "You already have a reservations."
          return
        end
      end


      @reservation=Reservation.new
      @reservation.member_id = current_member.id
      @reservation.room_id = params[:reservation][:room_id]
      @reservation.startdate = @startdate
      @reservation.starttime = @starttime
      @reservation.endtime = @endtime


      puts @reservation
      if @reservation.save!
        redirect_to action: 'index', notice: "Reservation created successfully."
      else
        redirect_to action: 'index', notice: "Error creating reservation."
      end
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation[:startdate].future?
      @reservation.destroy
      redirect_to action: 'index', notice: 'Successfully Deleted'
    else
      redirect_to action: 'index', notice: 'Reservations in the past can not be destroyed'
    end
  end

  private

  def reservation_params
    params.require(:reservations).permit(:user_id, :room_id, :date, :time)
  end

end
