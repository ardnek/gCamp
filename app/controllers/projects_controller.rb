class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    tracker_projects = TrackerAPI.new
    @tracker_projects = tracker_projects.projects(current_user.pivotal_tracker_token)
  end

  def new
    @project = Project.new
  end

  def create
    project_params=params.require(:project).permit(:name)
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project was successfully created."
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

end
