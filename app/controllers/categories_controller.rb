class CategoriesController < ApplicationController
  

  # GET /categories or /categories.json
  def index
    @categories = Category.all.order(name: :asc).load_async
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    
    if @category.save
     redirect_to categories_url, notice: "creado"
    else
      flash.now[:alert] = "No se pudo crear la categoría. Por favor, verifica que el nombre no esté vacío y no sea el mismo que otro."
      render :new, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if category.update(category_params)
      redirect_to categories_url, notice: "Category was successfully updated." 
    else
      render :edit, status: :unprocessable_entity     
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def category
      @category = Category.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
