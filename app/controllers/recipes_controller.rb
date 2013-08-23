class RecipesController < ApplicationController
  def index
		@recipes = Recipe.all
  end

  def show
		@recipe = Recipe.find(params[:id])
		@comments = Comment.where('recipe_id = '+@recipe.id.to_s)
  end

  def new
  end

  def create
		@recipe = Recipe.new
		@recipe.name = params[:name]
		@recipe.description = params[:description]
		@recipe.ingredients = params[:ingredients]
		@recipe.directions = params[:directions]
		@recipe.photo = params[:photo]
		@recipe.user_id = session[:user_id]
		if @recipe.save
			redirect_to root_path, :notice => "Resepti tallennettu!"
		else
			flash.alert = "Reseptissä puutteita"
			render 'new'
		end
  end

  def destroy
  end
	
end
