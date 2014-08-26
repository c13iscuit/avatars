class UsersController < ApplicationController

  def index
    @everyone = User.order('created_at desc')
  end

  def new
    @new_user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :users
    else
      flash[:notice] = "Username and Avatar can't be blank!"
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
    params.require(:user).permit(:username, :avatar)
  end

end
