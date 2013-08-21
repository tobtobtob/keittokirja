class Recipe < ActiveRecord::Base
has_attached_file :photo, :styles => { :small => "100x100>", :normal => "600x600>" }
validates_presence_of :name, :directions, :user_id, :description
validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
