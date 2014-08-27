class UsersController < ApplicationController

  def index
    @everyone = User.order('created_at desc')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :users
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to :users
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar, :password, :password_confirmation)
  end
end
