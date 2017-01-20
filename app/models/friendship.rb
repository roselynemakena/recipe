class Friendship < ApplicationRecord

	belongs_to :user
	belongs_to :friend,-> {distinct}, class_name: 'User'
end
