class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  before_action do
    @projects = Project.all
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user


  private

  def require_login
    unless current_user
      #flash[:notice] = "You must be logged in to access that action."
      redirect_to sign_in_path, notice: "You must be logged in to access that action."
    end
  end

end
