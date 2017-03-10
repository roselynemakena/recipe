class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  skip_before_filter :authenticate_user!, only: [:index]
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 6)
  end

  def show
  end
  def get_items

  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(user_id: current_user.id))

      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new }
      end
  end
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    def recipe_params
      params.require(:recipe).permit(:name, :description, item_ids: [])
    end
end
