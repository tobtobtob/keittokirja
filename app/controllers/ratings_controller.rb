class RatingsController < ApplicationController

#metodi muodostaa parametreista uudeen arvion, ja tallentaa sen tietokantaan.
#jos tallennus onnistuu, mahdollinen edellinen käyttäjän samasta reseptistä tekemä arvio poistetaan,
#jotta yksi henkilö voi arvioida tietyn reseptin vain kerran, mutta
#arviotaan pystyy muuttamaan jälkeenpäin.
  def create
		old_rating = Rating.where("user_id = #{current_user.id} and recipe_id = #{params[:recipe_id]}").take
		new_rating = Rating.new
		new_rating.rating = params[:rating]
		new_rating.user_id = current_user.id
		new_rating.recipe_id = params[:recipe_id]
		
		if new_rating.save
			if old_rating
				old_rating.delete
			end
			redirect_to recipe_path(Recipe.find(params[:recipe_id]).id),:notice => "arvio tallennettu"
		else
			flash.alert = "Arvion tallennus epäonnistui"
			redirect_to recipe_path(Recipe.find(params[:recipe_id]).id)
  	end
	end
end
