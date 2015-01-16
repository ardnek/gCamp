class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :projects

  def projects
    @projects = Project.all
  end

  # def authorize_member
  #   current_user.member?(@project)
  # end

  helper_method :current_user
  helper_method :require_login
  helper_method :current_user_member?
  helper_method :owner?
  helper_method :admin?
  helper_method :guest?


  private

  def owner?
    @project.memberships.where(role: 'Owner', user_id: current_user.id).exists? || current_user.admin?
  end

  def admin?
    self.admin
  end

  # def member?
  #   @project.memberships.where(role: 'Member', user_id: current_user).exists?
  # end

  def current_user_member?
    @project.memberships.where(user_id: current_user).exists? || current_user.admin?
  end

  # def guest?
  #   current_user == nil
  # end

  def current_user
    session[:user_id]
    User.find_by(id: session[:user_id])
    # @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      session[:first_url] = request.url if request.get?
      #flash[:notice] = "You must be logged in to access that action."
      redirect_to sign_in_path, notice: "You must be logged in to access that action."
    end
  end

  def redirect_to_previous_url_or_project
    redirect_to (session[:first_url] || projects_path)
    session.delete(:first_url)
  end
end
