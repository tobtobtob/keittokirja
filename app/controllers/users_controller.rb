class UsersController < ApplicationController
  def new
		@user = User.new
  end

#Metodia kutsutaan kun kirjautumaton käyttäjä syöttää uuden käyttäjän tiedot
#tiedot tallennetaan, jos kaikki vaaditut tiedot mukana, jakäyttäjä ohjataan etusivulle.
  def create
		@user = User.new
		@user.nick = params[:nick]
		@user.password = params[:password]
		@user.password_confirmation = params[:password_confirmation]
		if @user.save
			redirect_to root_path, :notice => "Uusi tunnus luotu!"
		else
			flash.now.alert = "Virheellinen käyttäjätunnus tai salasana"
			render 'users/new'
		end
  end

  def show
  end
end
