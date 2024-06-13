# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :protect_pages, only: :show

  def index
    if params[:query].present? && params[:query].start_with?('@')
      username = params[:query][1..-1]
      @usuarios = User.includes(:faculty).where("username ILIKE ?", "%#{username}%")
    elsif params[:query].present? && params[:query].start_with?('!')
      faculty_name = params[:query][1..-1]
      @usuarios = User.includes(:faculty).joins(:faculty).where("faculties.name ILIKE ?", "%#{faculty_name}%").order("promotion DESC")
    elsif params[:query].present? && params[:query].start_with?('#')
      promotion_ano = params[:query][1..-1]
      @usuarios = User.where("promotion ILIKE ?", "%#{promotion_ano}%")
    else
      @usuarios = User.includes(:faculty).all.order(created_at: :desc)
    end

    @usuarios = @usuarios.paginate(page: params[:page], per_page: 15)
  end
    

    

def show
  if params[:username].present?
    @user = User.find_by(username: params[:username])

    if @user.nil?
      redirect_to root_path, alert: 'Usuario no encontrado'
    else
      @publicaciones = @user.publicacions.order(created_at: :desc)
    end
  end
end

def destroy
  @user = User.find_by(id: params[:username])

  if @user.destroy
    redirect_to root_path, notice: 'Usuario eliminado correctamente.'
  else
    redirect_to root_path, notice: 'Usuario no se elimino.'
  end
  
end




end




