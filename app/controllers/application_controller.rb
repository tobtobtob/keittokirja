class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	helper_method :current_user
	helper_method :find_user_by_recipe
	helper_method :create_line_breaks
	helper_method :find_user_by_comment
  protect_from_forgery with: :exception
	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	def find_user_by_recipe(recipe)
		@user = User.find_by_id(recipe.user_id)
	end
#apumetodi muuttaa parametrina annetun teksin rivinvaihdot html:n ymmärtämään muotoon.
	def create_line_breaks(text)
		text.gsub("\n","</br>" ).html_safe
	end
	
	def find_user_by_comment(comment)
		User.find(comment.user_id)
	end
end
