class FoodsController < ApplicationController
  before_action :set_user, expect: [:update]
  def index
    @user = current_user
    @foods = @user.foods.includes(:user)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food deleted successfully!'
    else
      flash.now[:alert] = @food.errors.full_messages.first if @food.errors.any?
      render :index, status: 400
    end
    redirect_to foods_path(current_user)
  end

  private

  def food_params
    params.require(:food).permit(:name, :quantity, :price, :measurement_unit)
  end

  def set_user
    @user = current_user
  end
end
