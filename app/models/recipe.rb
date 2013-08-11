class Recipe < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "100x100>", :normal => "300x300>" }
	validates_presence_of :name, :directions, :ingredients, :user_id, :description
end
