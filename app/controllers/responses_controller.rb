class ResponsesController < ApplicationController
    before_action :set_comment
    
    def create
      @response = Response.new(response_params)
      if @response.save
        redirect_to @comment, notice: 'Respuesta creada correctamente.'
      else
        redirect_to @comment, alert: 'Hubo un error al crear la respuesta.'
      end
    end
  
    private
  
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end
  
    def response_params
      params.require(:response).permit(:content, :user_id, :comment_id)
    end
end
  