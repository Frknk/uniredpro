class SocialsController < ApplicationController
    def new
      @social = Social.new
    end
  
    def create
      # Buscar si el usuario ya tiene registros de redes sociales
      existing_social = Social.find_by(user_id: Current.user.id)
  
      if existing_social
        # Si el usuario ya tiene registros, actualizarlos con los nuevos datos
        existing_social.update(social_params)
        redirect_to usuario_path(Current.user.username), notice: 'El recurso social se actualizó exitosamente.'
      else
        # Si el usuario no tiene registros, crear uno nuevo
        @social = Social.new(social_params)
        @social.user_id = Current.user.id
        if @social.save
          redirect_to usuario_path(Current.user.username), notice: 'El recurso social se creó exitosamente.'
        else
          render :new
        end
      end
    end
  
    private
  
    def social_params
        params.require(:social).permit(:whatsapp, :facebook, :telegram, :fotoperfil, :descripcionperfil)
    end
  end
  