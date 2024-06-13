class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :set_current_user#se ejecutra antes de cualquier accion en los controladores,- ahora lo que tenemos que hacer es identificar al usuario con el valor d ela sesiion
    #- es decir obtener eser user id, almacenado en la sesion”controlador”
    #- para sacar de que usuario se trata
    before_action :protect_pages


    def set_current_user
        Current.user=User.find_by(id: session[:user_id]) if session[:user_id] #esa clave devuelve el id del usuaio qu eesta almacenaod en session,leer la sesion, que usuario , buscar al usuario que esta haciendo la peticion
    end

    def protect_pages
        #redericcionar al login cuando no halla un current user,
        redirect_to new_session_path, alert: 'tienes que inciar sesion o registrarte' unless Current.user
    end

    def autorizar! record = nil
        if record
            es_permitido=record.user_id==Current.user.id || Current.user.admin? 
            redirect_to publicaciones_path, alert: "no tienes autorizacion" unless es_permitido
        else
            Current.user.admin?
        end
    end
end
