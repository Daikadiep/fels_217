class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      render file: "public/404.html", layout: false
    end
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save

      flash[:info] = t(".suc")
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :user_name, :email, :password,
      :password_confirmation
  end
end
