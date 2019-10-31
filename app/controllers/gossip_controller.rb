class GossipController < ApplicationController
  
  def new
  	Gossip.new
    @comment = Comment.new
  end

  def create
  id = session[:user_id]
  @user = User.find(id)
    #anonymous=User.new(first_name:"Anonymous", last_name:"unknown",age: 99,description: "unknown",email:"unknown#{rand(1000)}@mail.com",city_id:City.all.sample.id)
    #anonymous.save
  	@gossip=Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: session[:user_id])
      if @gossip.save
        render 'index'
      else
        anonymous.destroy
        render 'new'
      end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @city = City.find(params[:id])
    @comment = Comment.where('gossip_id': @gossip.id)

  end

  def index
    
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find(params[:id])

  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      @gossip = Gossip.find_by(id:params[:id])

    if @gossip.update(title:params[:title], content:params[:content], id:params[:id])
      redirect_to gossip_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = "Potin supprimé !"
    redirect_to welcome_index_path
  end

end
