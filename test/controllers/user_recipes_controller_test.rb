# require 'test_helper'

# class UserRecipesControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @user_recipe = user_recipes(:one)
#   end

#   test "should get index" do
#     get user_recipes_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_user_recipe_url
#     assert_response :success
#   end

#   test "should create user_recipe" do
#     assert_difference('UserRecipe.count') do
#       post user_recipes_path, params: { user_recipe: { recipe_id: @user_recipe.recipe_id, user_id: @user_recipe.user_id } }
#     end

#     assert_redirected_to user_recipe_url(UserRecipe.last)
#   end

#   test "should show user_recipe" do
#     get user_recipe_url(@user_recipe)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_user_recipe_url(@user_recipe)
#     assert_response :success
#   end

#   test "should update user_recipe" do
#     patch user_recipe_url(@user_recipe), params: { user_recipe: { recipe_id: @user_recipe.recipe_id, user_id: @user_recipe.user_id } }
#     assert_redirected_to user_recipe_url(@user_recipe)
#   end

#   test "should destroy user_recipe" do
#     assert_difference('UserRecipe.count', -1) do
#       delete user_recipe_url(@user_recipe)
#     end

#     assert_redirected_to user_recipes_url
#   end
# end
