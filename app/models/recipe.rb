class Recipe < ApplicationRecord

  # scope :not_users_recipe, -> {where.not(:current_user == @recipes.user_id)}
  # named_scope :active, :conditions => {:archived_at => nil}

  validates :name, presence: true, length: {min: 5, maximum: 40}
  validates :description, presence: true, length: {min: 10, maximum: 500}

	belongs_to :user

	has_many :user_recipes
	has_many :recipe_items
	has_many :items, through: :recipe_items 
	has_many :users,-> {distinct}, through: :user_recipes




end
