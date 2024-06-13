class CommentsController < ApplicationController
  def create
    @publicacion = Publicacion.find_by(id: params[:publicacion_id])
    @comment = Comment.new(comment_params)
    publicacion_id=params[:publicacion_id]
    user_id=params[:user_id]  

     
    if @comment.save
      @notificacion = Notification.new(
        user_id: @comment.publicacion.user_id,
        publicacion_id: @comment.publicacion_id,
        message: "#{Current.user.username} comentó tu publicación"
      ) 
      
      if @notificacion.save
      
        redirect_to Publicacion.find(params[:publicacion_id]), notice: "Comentario creado correctamente"
      end
    else
      flash.now[:alert] = "Hubo un problema al crear el comentario"
      render "publicaciones/show"
    end
  end

  def destroy
    @publicacion = Publicacion.find(params[:publicacion_id])
    @comment = @publicacion.comments.find(params[:id])
    @comment.destroy
    redirect_to @publicacion, notice: "Comentario eliminado correctamente"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :publicacion_id, :user_id)
  end
end
