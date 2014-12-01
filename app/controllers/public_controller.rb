class PublicController < ApplicationController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :determine_layout

  private
  def determine_layout
    current_user ? "private" : "public"
  end

end
