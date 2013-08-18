class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    @user = User.new
  end

  def create
    # in Rails 3 line 9 would be
    # @user = User.new(params[:user])
  	@user = User.new(user_params)
  	ekjaj debug

    if @user.save
      sign_in @user
      redirect_to profile_path
    else
      @show = "register"
      render action: "new"
    end
  end

  def show
  	@user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
