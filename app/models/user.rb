class User < ActiveRecord::Base
	attr_accessible :nick, :password, :password_confirmation, :user_info
	
	attr_accessor :password
	before_save :encrypt_password

	validates_presence_of :password, :on => :create
	validates_confirmation_of :password
	validates_presence_of :nick
	validates_uniqueness_of :nick
	
	def self.authenticate(nick, password)
			user = User.find_by_nick(nick)
			if user && user.passw_hash == BCrypt::Engine.hash_secret(password, user.passw_salt)
				user
			else
				nil
			end
	end

	def encrypt_password
		if password.present?
			self.passw_salt = BCrypt::Engine.generate_salt
			self.passw_hash = BCrypt::Engine.hash_secret(password, passw_salt)
		end
	end		
	
end
