class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy,:recipes]
  before_action :confirm_current_user, only: [:edit,:update,:destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = 'Account was successfully created.'
      redirect_to '/'
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render "new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.password_digest == nil || @user.authenticate(user_params[:original_password])
      if @user.update(user_params)
        flash[:success] = 'Profile updated.'
        redirect_to '/'
      else
        flash.now[:danger] = @user.errors.full_messages.first
        render "edit"
      end
    else
      flash.now[:danger] = "Incorrect Original Password"
      render "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recipes
    @recipes = @user.recipes.includes(:user,:favourites).page params[:page]
    @recipes_id = @recipes.pluck(:id)
    @favourites = current_user_favourites
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:avatar,:original_password)
    end


    def confirm_current_user
      if @user != @current_user && @current_user.role != 0
        flash[:danger] = "Sorry, you don't have access to that page"
        redirect_to '/'
      end
    end
end
