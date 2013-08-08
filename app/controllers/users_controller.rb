class UsersController < ApplicationController
  def new
		@user = User.new
  end

  def create
		@user = User.new
		@user.nick = params[:nick]
		@user.password = params[:password]
		@user.password_confirmation = params[:password_confirmation]
		if @user.save
			redirect_to root_path, :notice => "Uusi tunnus luotu!"
		else
			render '/users/new'
		end
  end

  def show
  end
end
