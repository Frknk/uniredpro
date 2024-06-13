class FacultiesController < ApplicationController
    def index
      @faculties = Faculty.all
    end
  
    def new
      @faculty = Faculty.new
    end
  
    def create
      @faculty = Faculty.new(faculty_params)
      if @faculty.save
        redirect_to @faculty, notice: 'Facultad creada exitosamente.'
      else
        render :new
      end
    end
  
    def destroy
      @faculty = Faculty.find(params[:id])
      @faculty.destroy
      redirect_to faculties_url, notice: 'Facultad eliminada exitosamente.'
    end
  
    private
  
    def faculty_params
      params.require(:faculty).permit(:name)
    end
  end
  