class ProjectsController < ApplicationController
  before_action :authorize_member, only: [:show]
  before_action :authorize_owner, only: [:edit]

  def index
    @projects = Project.all
    #instantiate an instance of the TrackerAPI class. tracker_api variable is instance of the class
    #tracker_api is not an instance variable since it doesn't need to be displayed in the view
    tracker_api = TrackerAPI.new
    #calling the method and passing it a token
    #pass things down to views with an instance variable
    #this is client code
    @tracker_projects = tracker_api.projects(current_user.pivotal_tracker_token)
  end

  def new
    @project = Project.new
  end

  def create
    project_params=params.require(:project).permit(:name)
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_tasks_path(@project), notice: "Project was successfully created."
      Membership.create(project_id: @project.id, user_id: current_user.id, role: "Owner")
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project_params = params.require(:project).permit(:name)
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success]="Project was successfully deleted."
      redirect_to projects_path
    end
  end

  private

  def authorize_member
    @project = Project.find(params[:id])
    unless current_user_member?
      render file: 'public/404', status: :not_found, layout: false
    end
  end

  def authorize_owner
    @project = Project.find(params[:id])
    unless owner?
      render file: 'public/404', status: :not_found, layout: false
    end
  end

  # def project_params
  #   params.required(:project).permit(:name)
  # end

end
