class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params[:id])
    #@user = User.second
  end
  
  def create
    flash[:success] = "Welcome to the Sample App!"
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end
end
