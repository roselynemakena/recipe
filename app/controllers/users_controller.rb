class UsersController <ApplicationController
	# before_filter :set_user

def my_recipes
	@user = current_user
	@user_recipes = Recipe.where(user_id: current_user.id).paginate(page: params[:page], per_page: 9)
	
end
    def saved_recipes
    	@user = current_user
    @user_saved_recipes = current_user.recipes.paginate(page: params[:page], per_page: 9)
    # render plain: @user_recipes
  end

	def show
	@friend = User.find(params[:id])
	end

	def my_friends

		@friendships = current_user.friends
		
	end

	def add_friend
		@friend = User.find(params[:friend])
		current_user.friendships.build(friend_id: @friend.id)
		if current_user.save
			redirect_to my_friends_path
			flash[:success] = "Error following user"
		else
			redirect_to my_friends_path
			flash[:danger] = "Error following user"
		end
	end

private
def set_user
	@user = User.find(params[:id])
	
end

end