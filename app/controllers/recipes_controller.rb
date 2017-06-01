class RecipesController < ApplicationController
  
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :confirm_current_user, only: [:edit,:update,:destroy]

  

  

  require 'wikipedia'

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all.includes(:user,:favourites).page params[:page]
    @recipes_id = @recipes.pluck(:id)
    @user = @current_user
    @favourites = current_user_favourites
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = "Recipe created!"
      redirect_to @recipe
    else
      flash.now[:danger] = @recipe.errors.full_messages.first
      render "new"
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe updated!"
      redirect_to @recipe
    else
      flash.now[:danger] = @recipe.errors.full_messages.first
      render "edit"
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Recipe was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def search
    @recipes = Recipe.where('id' => params[:ids]).where('id' => PgSearch.multisearch(params[:search]).pluck(:searchable_id))
    @recipes_id = @recipes.pluck(:id)
    @user = @current_user
    @favourites = current_user_favourites
    respond_to do |format|
      format.js
    end
  end

  def filter
    if params[:type] == "mi"
      @recipes = Recipe.where('id' => params[:ids]).where(main_ingredient_id: params[:filter_id])
    else
      @recipes = Recipe.where('id' => params[:ids]).where(cuisine_id: params[:filter_id])
    end
    @recipes_id = @recipes.pluck(:id)
    @user = @current_user
    @favourites = current_user_favourites
    respond_to do |format|
      format.js
    end
  end

  def facts
    @ingredient = Ingredient.find(params[:id]).ingredient
    page = Wikipedia.find(@ingredient)
    @summary = page.summary
    if @summary == nil
      page = Wikipedia.find(@ingredient.split(" ").first)
      @summary = page.summary
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:user_id,:title,:description,:servings,:cooktime1,:cooktime2,:food_photo,:cuisine_id,:main_ingredient_id,
                                      ingredients_attributes: [:id,:_destroy,:amount,:unit,:ingredient],
                                      instructions_attributes: [:id,:_destroy,:step,:title,:description,:step_photo])
    end

    def confirm_current_user
      if @recipe.user != @current_user && @current_user.role != 0
        flash[:danger] = "Sorry, you don't have access to that page"
        redirect_to '/'
      end
    end

end


