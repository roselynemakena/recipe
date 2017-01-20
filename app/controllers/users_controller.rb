class UsersController <ApplicationController

def my_recipes
	@user = current_user
	@user_recipes = current_user.recipes
	
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


end