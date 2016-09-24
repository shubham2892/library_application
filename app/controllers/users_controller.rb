class UsersController < ApplicationController
  before_action :set_member, only: [:destroy, :show]

  def index

    @members = User.where(is_admin: true)
    #@user=User.all.order('created_at DESC')
  end

  def show

    @admin_detail = User.select('name, email, is_preconfigured' ).where(id: params[:id])
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
    @member=User.new
  end

  def create
    @member=User.new(member_params)
    if @member.save
      redirect_to action: 'index', notice: "User created successfully."
    else
      redirect_to action: 'index', notice: "Error creating user."
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = User.find(params[:id])
  end
  def member_params
    params.require(:user).permit(:name,:email,:password,:is_admin,:is_preconfigured)
  end
end
