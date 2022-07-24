class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_users
  before_action :set_dishes

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

      if @order.save
        redirect_to order_url(@order), notice: "Order was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @order.update(order_params)
        redirect_to order_url(@order), notice: "Order was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @order.destroy

      redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def set_users
      @users = User.all.pluck(:name, :address, :email, :password, :role)
    end

    def set_dishes
      @dishes = Dish.all.pluck(:name, :description, :price)
    end

    def order_params
      params.require(:order).permit(:date, :state, :user_id, :dish_id)
    end
end
