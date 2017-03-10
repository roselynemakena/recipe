class User < ApplicationRecord
  # Include default devise modules.
  # devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable,
  #         :confirmable, :omniauthable
  # include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
before_validation do
self.uid = email if uid.blank?
end
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

       has_many :user_recipes
       has_many :recipes,-> {distinct} ,through: :user_recipes

       has_many :friendships ,-> {distinct}
       has_many :friends,-> {distinct}, through: :friendships

 def full_name
 	return "#{first_name} #{last_name}".strip if (first_name) || (last_name)

 	
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
