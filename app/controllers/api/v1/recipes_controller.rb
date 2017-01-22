class Api::V1::RecipesController < Api::V1::ApiController
  before_action :set_recipe, only: [:show,:destroy]
  
  # skip_before_filter :authenticate_user!, only: [:index]

def index
  @recipes = Recipe.all
  render json: @recipes  
end
def show
  render json: @recipe
end
def new
  
end

def create
  @recipe = Recipe.new(recipe_params)
  if @recipe.save
  render status: 200, json: {message: "Successfully created", result: @recipe}.to_json
  else
  render status: 406, json: {message: "Error creating recipe", error: @recipe.errors }
  end  
end
def destroy
  if @recipe.destroy
    render status: 200, json: {message: "Successfully deleted", result: @recipe}
  else
    render status: 406, json: {message: "Error deleting recipe", result: @recipe}

  end
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