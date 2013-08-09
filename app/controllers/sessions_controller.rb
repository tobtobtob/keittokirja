class SessionsController < ApplicationController
  def new
  end

  def create
		user = User.authenticate(params[:nick], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Kirjautuminen onnistui!"
		else
			flash.now.alert = "Virheellinen käyttäjätunnus tai salasana"
			render "new"
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Uloskirjautuminen onnistui!"
  end
end
