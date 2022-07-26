module Api
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  def index
    @user = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

      if @user.save
        !login
        redirect_to user_url(@user), notice: "User was successfully created."
        render 'api/users/index', status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  def update
      if @user.update(user_params)
        render 'api/users/show', status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
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
      params.require(:user).permit(:name, :address, :role, :password, :password_confirmation)
    end
end
end