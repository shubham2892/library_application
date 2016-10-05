class MembersController < ApplicationController
  before_action :set_member, only: [:destroy, :show]

  def index
    @members = Member.all
  end

  def home

  end
  def show
    @booking_history = Reservation.where(member_id: params[:id])
  end

  def destroy
    if @member.id == current_member.id
      redirect_to action: 'index', notice:'Cannot delete yourself. Sorry bruh!' and return
    end
    if @member[:is_preconfigured]
      redirect_to action: 'index', notice:'Cannot delete preconfigured users'
    else
      Reservation.where(member_id: params[:id]).destroy_all
      @member.destroy
      redirect_to action: 'index', notice:'Successfully Deleted'
    end
  end

  def new
    @member=Member.new
  end

  def create_admin
    @member=Member.new(member_params)
    if @member.save
      redirect_to action: 'index', notice: "User created successfully."
    else
      redirect_to action: 'index', notice: "Error creating user."
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.

  def set_member
    @member = Member.find(params[:id] )
  end

  def member_params
    params.require(:member).permit(:name,:email,:password,:is_admin,:is_preconfigured)
  end

end