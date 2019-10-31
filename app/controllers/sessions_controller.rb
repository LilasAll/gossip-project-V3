class SessionsController < ApplicationController
	def new

	end

	def index

	end

	def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])
  puts"========================================================================================"
  puts params
  puts"========================================================================================"
  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
		if user && user.authenticate(params[:password])
	  	flash[:notice] = 'Tu es bien connecté !'
	    session[:user_id] = user.id
			redirect_to welcome_index_path
	  else
	    #flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
	end

	def destroy
		session.delete(:user_id)
		redirect_to welcome_index_path
	end

end
