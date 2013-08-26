class CommentsController < ApplicationController
  def create
		comment = Comment.new
		comment.recipe_id = params[:recipe_id]
		comment.user_id = session[:user_id]
		comment.content = params[:comment]
		if comment.save
			redirect_to recipe_path(Recipe.find(comment.recipe_id).id), :notice => "Kommentti tallennettu"
		else
			flash.alert = "Kommentin tallennus epäonnistui"
			redirect_to  recipe_path(Recipe.find(comment.recipe_id).id)
		end
  end

	def destroy
		comment = Comment.find(params[:id])
		if !owner_of_comment(comment)
			redirect_to recipe_path(Recipe.find(comment.recipe_id).id) 
			return
		end
		comment.delete
		redirect_to recipe_path(Recipe.find(comment.recipe_id).id) 
	end
end
