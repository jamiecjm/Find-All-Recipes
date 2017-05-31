class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  include FavouritesHelper


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

end
