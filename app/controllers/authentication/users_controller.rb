class Authentication::UsersController < ApplicationController
    skip_before_action :protect_pages
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        
        if @user.save
            session[:user_id]=@user.id
            redirect_to publicaciones_path, notice: 'tu cuenta se ha creado'
        else
            render :new, status:  :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:emails, :username, :password, :promotion).merge(faculty_id: params[:faculty_id])
    end
      
      

end