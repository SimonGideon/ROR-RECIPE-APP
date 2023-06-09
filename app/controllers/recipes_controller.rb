class RecipesController < ApplicationController
  before_action :set_user, expect: [:update]

  def index
    @recipes = @user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.includes(:foods).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def public_allocation
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: params[:recipe][:public])
    redirect_to @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = @user

    if @recipe.save
      flash[:notice] = 'Recipe created successfully!'
      redirect_to recipe_path(id: @recipe.id)
    else
      flash.now[:alert] = @recipe.errors.full_messages.first if @recipe.errors.any?
      render :new, status: 422
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = 'Recipe deleted successfully!'
      redirect_to recipes_path
    else
      flash.now[:alert] = @recipe.errors.full_messages.first if @recipe.errors.any?
      render :index, status: 400
    end
  end

  def toggle
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    text = @recipe.public? ? 'public' : 'private'

    if @recipe.save
      flash[:notice] = "#{@recipe.name} is now #{text}!"
    elsif @recipe.errors.any?
      flash[:alert] = @recipe.errors.full_messages.first
    end
    redirect_to recipe_path(id: @recipe.id)
  end

  private

  def set_user
    @user = current_user
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
