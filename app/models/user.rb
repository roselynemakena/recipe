class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_uniqueness_of :email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

       has_many :user_recipes
       has_many :recipes,-> {distinct} ,through: :user_recipes

       has_many :friendships ,-> {distinct}
       has_many :friends,-> {distinct}, through: :friendships

 def full_name
 	return "#{first_name} #{last_name}".strip if (first_name) || (last_name)
else false
 	
 end
  def not_following_chef?(user_id)
    friendships.where(friend_id: user_id).count < 1
  end

 def can_add_recipe?(recipe_id)
  	!recipe_already_added?(recipe_id)
  end

  def recipe_already_added?(recipe_id)
  	recipe = Recipe.find(recipe_id)
  	return false unless recipe
	user_recipes.where(recipe_id: recipe_id).exists?
  end

    def except_current_user_recipes(recipes)
    # recipes.reject {|recipe| user_recipe.id == self.id }
  end
end
