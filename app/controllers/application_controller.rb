class ApplicationController < ActionController::Base

	helper_method :current_user
	helper_method :find_user_by_recipe
	helper_method :create_line_breaks
	helper_method :find_user_by_comment
	helper_method :number_of_comments
	helper_method :calculate_rating
  protect_from_forgery with: :exception

	private

#apumetodi palauttaa kutsumishetkellä kirjautuneen käyttäjän. jos käyttäjää
#ei ole kirjautunut, palutus on 'null'
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

#apumetodi, joka palauttaa käyttäjän, joka on kirjoittanut annetin reseptin.
	def find_user_by_recipe(recipe)
		@user = User.find_by_id(recipe.user_id)
	end

#apumetodi muuttaa parametrina annetun teksin rivinvaihdot html:n ymmärtämään muotoon.
	def create_line_breaks(text)
		text.gsub("\n","</br>" ).html_safe
	end

#tämä apumetodi palauttaa käyttäjän, joka on kirjoittanut annetun kommentin	
	def find_user_by_comment(comment)
		User.find(comment.user_id)
	end

#apumetodi palauttaa parametrina annettuun reseptiin liittyvien 
#kommenttien määrän.
	def number_of_comments(recipe)
		recipe.comments.size
	end

#apumetodi ottaa parametrinä reseptin ja palauttaa laskemansa keskiarvon reseptille
#annetuista arvioista.
	def calculate_rating(recipe)
		ratings = recipe.ratings
		ka = 0;
		ratings.each do |rating|
			ka += rating.rating
		end
		(ka/ratings.size.to_f)
	end
end
