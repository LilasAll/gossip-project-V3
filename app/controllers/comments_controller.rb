class CommentsController < ApplicationController
  def new
  	Comment.new
  end

  def create
  	  @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(user: User.first, gossip: @gossip, content: params[:content])
    if @comment.save
      flash[:success] = "You created a Comment!"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:danger] = "A problem occured my friend."
      render gossip_path(@gossip.id)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
     @comments = Comment.all
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  	    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      flash[:success] = "You updated a Comment!"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:danger] = "A problem occured my friend."
      render edit_gossip_comment_path(@gossip.id, @comment.id)
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Commentaire supprimé !"
    redirect_to gossips_path
  end
end

end
