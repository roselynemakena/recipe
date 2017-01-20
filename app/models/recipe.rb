class Recipe < ApplicationRecord

	belongs_to :user

	has_many :user_recipes
	has_many :users,-> {distinct}, through: :user_recipes

end
