class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    @user = User.new
  end

  def create
 
  	@user = User.new(user_params)


    if @user.save
      sign_in @user
      redirect_to user_path(@user)
    else
      @show = "register"
      render action: "index"
    end
  end

  def show
  	@user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end
end
