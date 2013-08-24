class RecipesController < ApplicationController

#metodi toimii sekä etusivuna, joka näyttää kaikki reseptit, että toteuttaa hakutoiminnallisuuden.
#jos parametrinä ei ole annettu hakusanoja, annetaan näkymään kaikki reseptit, jos on, annetaan
#vain kyseisen hakusanan sisältävät reseptit 
  def index
		@recipes = Recipe.search(params[:search])
  end

#Näytettävästä reseptistä ohjataan näkymään itse resepti sekä siihen 
#kommentit.
  def show
		@recipe = Recipe.find(params[:id])
		@comments = Comment.where('recipe_id = '+@recipe.id.to_s)
  end

  def new
  end

#metodia kutsutaan kun käyttäjä lähettää uuden reseptin lisättäväksi.
#resepti tallennetaan tietokantaan ja käyttäjä ohjataan reseptin sivulle.
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
