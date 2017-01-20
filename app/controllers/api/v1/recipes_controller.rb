class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show,:edit]

  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :authenticate_user!
def index
  @recipes = Recipe.all
  render json: @recipes  
end
def show
  render json: @recipe
end

def create
  @recipe = Recipe.new(recipe_params)
  if @recipe.save
  render json: {result: @recipe, status: :ok}
  else
  render json: {error: @recipe.errors, status: :unprocessable_entity }
  end  
end
def destroy
  
end
def edit
  
end


private
def set_recipe
  @recipe = Recipe.find(params[:id])
 
end
def recipe_params
  params.require(:recipe).permit(:name, :description, :user_id)
  
end

end