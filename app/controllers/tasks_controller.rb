class TasksController < ApplicationController

  before_action do
      @project = Project.find(params[:project_id])
    end


before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = params[:type] == "incomplete"
    @tasks = @project.tasks.where(complete:false)
  if params[:type] == "all"
    @tasks = @project.tasks.all
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @project.tasks.find(params[:id])
    @comment = Comment.new
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @edit_task = true
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)
      if @task.save
        redirect_to project_task_path(@project, @task), notice: 'Task was successfully created.'
      else
        render :new
      end
    end


  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json

  def update
      if @task.update(task_params)
        redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
      redirect_to project_tasks_path, notice: 'Task was successfully destroyed.'
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :complete, :date)
    end
end
