class RatingsController < ApplicationController
  def create
		old_rating = Rating.where("user_id = #{current_user.id} and recipe_id = #{params[:recipe_id]}").take
		if old_rating
			#Rating.destroy(old_rating.id)	
		else
		end
		new_rating = Rating.new
		new_rating.rating = params[:rating]
		new_rating.user_id = current_user.id
		new_rating.recipe_id = params[:recipe_id]
		
		if new_rating.save
			if old_rating
				old_rating.delete
			end
			redirect_to recipes_path(Recipe.find(params[:recipe_id])),:notice => "arvio tallennettu"
		else
			flash.alert = "Arvion tallennus epäonnistui"
			redirect_to recipes_path(Recipe.find(params[:recipe_id]))
  	end
	end
end
