class Rating < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :user
	validates_presence_of :rating, :user_id, :recipe_id
end
