class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    #before_action :determine_layout

    #private
    #def determine_layout
      #current_user ? "private" : "public"
    #end

  def current_user
  User.find_by(id: session[:user_id])
  end

  helper_method :current_user

end
