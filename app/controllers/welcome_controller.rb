class WelcomeController < ApplicationController
  def index
    @user = User.new
    @notice = " "
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @notice = "Successfully Created"
      render :index
    else
      @notice = "Failed"
      render :index
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
