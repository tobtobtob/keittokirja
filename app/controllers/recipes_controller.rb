class RecipesController < ApplicationController
  def index
  end

  def show
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
