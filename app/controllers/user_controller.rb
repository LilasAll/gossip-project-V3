class UserController < ApplicationController
	  def new
  end
  
  def create
    @user = User.new(first_name:params[:first_name],last_name:params[:last_name], email:params[:email],age:params[:age],password:params[:password],city_id:"11",description:params[:description])
		puts "==================================="
		puts params
		puts "======================================"
		if @user.save
  				flash[:notice] = 'Inscription réussi !'
  				redirect_to welcome_index_path
  				else
  					flash[:notice]
    			render :new
  			end
  end
  
  private

  def creation_params
    #params.permit(:email, :password, :first_name, :last_name, :description)
  end
end
