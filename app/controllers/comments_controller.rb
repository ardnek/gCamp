class CommentsController < ApplicationController

  #before_filter :require_user

  before_action do
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
  end

  #def new
    #@comment = current_user.comments.build
  #end

  #def index
  #@comments = current_user.comments
  #@comments = Comment.where(user_id:current_user.id)
  #end

  def create
    #@comment = Comment.new(params.require(:comment).permit(:comment, :user_id, :task_id))
    #@comment.task = @task
    @comment = @task.comments.new(params.require(:comment).permit(:comment, :user_id, :task_id))
    @comment.user_id = current_user.id
    #@comment.task_id = @task.id


    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created."
    else
      redirect_to project_task_path(@project, @task)
    end
  end
end
