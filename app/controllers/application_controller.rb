class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  include FavouritesHelper

  before_action :set_current_user


  def login_required
  	if !signed_in?
  		session[:path] = request.fullpath
  		byebug
	    respond_to do |format|
	      format.html { redirect_to '/sessions/new', notice: 'Please sign in' }
	      format.json { head :no_content }
	    end
  	end
  end

  def set_current_user
    if signed_in?
      @current_user = current_user
    end
  end

end
