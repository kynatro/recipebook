class RecipesController < ApplicationController
  before_filter :get_recipe, only: [:show, :edit, :destroy, :update]
  before_filter :maybe_build_objects, only: [:edit, :new]

  def create
    @recipe = Recipe.create(recipe_params)
    
    if @recipe.valid?
      redirect_to @recipe
    else
      flash[:error] = "There were problems creating your recipe"
      render action: "new"
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = "Recipe deleted successfully"
    redirect_to recipes_url
  end

  def edit
  end

  def index
    @recipes = Recipe.all
  end

  def new
  end

  def show
  end

  def update
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Recipe successfully updated"
      redirect_to @recipe
    else
      flash.now[:error] = "There were problems updating your recipe"
      render action: "edit"
    end
  end

  protected
    def get_recipe
      @recipe = Recipe.find_by id: params[:id]
      unless @recipe
        flash.now[:error] = "Could not find that recipe"
        redirect_to recipes_url
      end
    end

    def maybe_build_objects
      @recipe = Recipe.new if !@recipe
      @recipe.quantities.build if @recipe.quantities.empty?
      @recipe.quantities.first.build_ingredient if !@recipe.quantities.first.ingredient
      @recipe.uploads.build if @recipe.uploads.empty?
    end

  private
    def recipe_params
      params.require(:recipe).permit(
        :title, 
        :description, 
        :instructions,
        {
          uploads_attributes: [:image, :id, :_destroy]
        },
        {
          quantities_attributes: [
            :id, 
            :amount, 
            :_destroy,
            { ingredient_attributes: [:label] }
          ]
        }
      )
    end
end
