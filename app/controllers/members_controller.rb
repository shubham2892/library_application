class MembersController < ApplicationController
  before_action :set_member, only: [:destroy, :show]

  /*def indexMem

    @members = Member.where.not(is_admin: true)
  end

  def indexAdmin

    @members = Member.where(is_admin: true)
    #@user=User.all.order('created_at DESC')
  end*/

  def index
    @members = Member.all
  end

  def show
    @booking_history = Reservation.where(member: params[:id])
  end

  def destroy
    if @member[:is_preconfigured]
      redirect_to action: 'index', notice:'Cannot delete preconfigured users'
    else
      @member.destroy
      redirect_to action: 'index', notice:'Successfully Deleted'
    end
  end

  def new
    @member=Member.new
  end

  def create
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
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name,:email,:password,:is_admin,:is_preconfigured)
    end

end
