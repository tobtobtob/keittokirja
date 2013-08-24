class CommentsController < ApplicationController
  def create
		comment = Comment.new
		comment.recipe_id = params[:recipe_id]
		comment.user_id = session[:user_id]
		comment.content = params[:comment]
		if comment.save
			redirect_to recipes_path(Recipe.find(comment.recipe_id)), :notice => "Kommentti tallennettu"
		else
			flash.alert = "Kommentin tallennus epäonnistui"
			redirect_to  recipes_path(Recipe.find(comment.recipe_id))
		end
  end
end
