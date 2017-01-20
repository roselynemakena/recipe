class UserRecipe < ApplicationRecord

	belongs_to :user
	belongs_to :recipe

	def can_follow_chef?(user_id)
	  user = User.find(user_id)
	end
end
