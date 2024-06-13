class Authentication::SessionsController < ApplicationController
    skip_before_action :protect_pages
    
    def new
    end

    def create
        @user=User.find_by("emails= :login OR username = :login", {login: params[:login]})
        
        if @user&.authenticate(params[:password])
            session[:user_id]=@user.id
            redirect_to publicaciones_path, notice: 'Bienvenido'
        else
            redirect_to new_session_path, alert: 'login invalidos'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: 'Sesión cerrada exitosamente.'
    end

    
      

end