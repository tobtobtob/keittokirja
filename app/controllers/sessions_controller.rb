class SessionsController < ApplicationController
  def new
  end

  def create
		user = User.authenticate(params[:nick], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Kirjauduttu sisään"
		else
			flash.now.alert = "Virheellinen käyttäjätunnus tai salasana"
		render "new"	
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Kirjauduttu ulos"
  end
end
