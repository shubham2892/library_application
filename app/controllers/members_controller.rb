class MembersController < ApplicationController
  before_action :set_member, only: [:destroy, :show]

  def index

    @members = User.where.not(is_admin: true)
  end

  def show
    @booking_history = Reservation.where(user: params[:id])
  end

  def destroy
    @member.destroy
    redirect_to action: 'index', notice:'Admin successfully Deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = User.find(params[:id])
    end

end
