class UserRecipesController < ApplicationController
  before_action :set_user_recipe, only: [:show, :edit, :update]

  # GET /user_recipes
  # GET /user_recipes.json
  def index
    @user_recipes = UserRecipe.all
  end

  def show
  end

  # GET /user_recipes/new
  def new
    @user_recipe = UserRecipe.new
  end

  # GET /user_recipes/1/edit
  def edit
  end

  # POST /user_recipes
  # POST /user_recipes.json
  def create

    @user_recipe = UserRecipe.new( recipe_id: params[:recipe_id], user_id: current_user.id)

    respond_to do |format|
      if @user_recipe.save
        format.html { redirect_to recipes_path, notice: 'Following #{@user_recipe.recipe.name} recipe.' }
        # format.json { render :show, status: :created, location: @user_recipe }
      else
        format.html { render :new }
        format.json { render json: @user_recipe.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @user_recipe.update(user_recipe_params)
        format.html { redirect_to recipes_path, notice: 'User recipe was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user_recipe }
      else
        format.html { render :edit }
        format.json { render json: @user_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_recipe = UserRecipe.where(user_id: current_user, recipe_id: params[:recipe_id])

    if  @user_recipe.destroy(@user_recipe)
    respond_to do |format|
      format.html { redirect_to my_recipes_path, notice: 'Unfollowed Recipe.' }
      format.json { head :no_content }
    end

    else
      redirect_to my_recipes_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_recipe
      @user_recipe = UserRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_recipe_params
      params.require(:user_recipe).permit(:user_id, :recipe_id)
    end
end
