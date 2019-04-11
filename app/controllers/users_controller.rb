class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
    rescue ActiveRecord::RecordNotFound
    render "errors/error_404"
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t("Welcome_to_the_Sample_App!")
      redirect_to @user
    else
      flash[:success] = t("Create product Fail! >.<")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
