class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  include FavouritesHelper

  before_action :set_current_user

  
  def login_required
    if !signed_in?
      flash[:info] = "Please Sign In"
      redirect_to '/sessions/new'
    end
  end

  def set_current_user
    if signed_in?
      @current_user = current_user
    end
  end

end
