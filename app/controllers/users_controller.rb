class UsersController < ApplicationController

  def index
    # Intended to show a gallery of other users' avatars
    # @everyone = User.order('created_at desc')
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
    if current_user
      @user = current_user
    else
      redirect_to :users
    end
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
