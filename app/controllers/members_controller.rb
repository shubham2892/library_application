class MembersController < ApplicationController
  before_action :set_member, only: [:destroy, :show]

  def index
    @members = Member.all
  end

  def home

  end
  def show

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