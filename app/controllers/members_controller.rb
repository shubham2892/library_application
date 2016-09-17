class MembersController < ApplicationController

  def index
    @members = User.where.not(is_admin: true)
  end

  def show
    puts params
    @member = User.find(params[:id])
  end

end
