class ReactionsController < ApplicationController
  before_action :set_publicacion

  def index
    # Buscar si el usuario ya ha reaccionado a esta publicación
    existing_reaction = @publicacion.reactions.find_by(user_id: session[:user_id])

    if existing_reaction
      # Si el usuario ya ha reaccionado, eliminar la reacción anterior
      existing_reaction.destroy
    end

    # Crear la nueva reacción
    @reaction = @publicacion.reactions.build(user_id: session[:user_id], reaction_type: params[:reaction_type])
    if @reaction.save
      redirect_to publicaciones_path
    else
      redirect_to @publicacion, alert: 'No se pudo agregar la reacción.'
    end
  end
  
  def reacciones
    @reactions = @publicacion.reactions
  end

  private

  def set_publicacion
    @publicacion = Publicacion.find(params[:publicacion_id])
  end
end


