class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.email} has been successfully created."
      redirect_to users_path
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end