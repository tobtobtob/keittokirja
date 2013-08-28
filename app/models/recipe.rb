class Recipe < ActiveRecord::Base

	has_many :comments
	has_many :ratings
	belongs_to :user
	belongs_to :recipe
	
	has_attached_file :photo, :styles => { :small => "100x100>", :normal => "600x600>" }
	validates_presence_of :name, :directions, :user_id
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def self.search(search)
		if search
			Recipe.where("lower(name) like ? or ingredients like ?", "%#{search.downcase}%","%#{search}%")
		else
			Recipe.all
		end
	end
end
