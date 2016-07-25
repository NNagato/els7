class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t("flash.welcome")
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
      :password, :password_confirmation)
  end
end