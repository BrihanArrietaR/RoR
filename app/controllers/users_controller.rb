class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :user_default

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to user_url(@user), notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @user.update(user_params)
        redirect_to user_url(@user), notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @user.destroy

      redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_default
    end

    def user_params
      params.require(:user).permit(:name, :address, :role, :password, :email)
    end
end
