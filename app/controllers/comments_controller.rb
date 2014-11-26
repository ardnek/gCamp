class CommentsController < ApplicationController

  def create
    @projects = Project.all
    @tasks = Task.all

    @project = Project.find(params[:project_id])
    #@task = @project.tasks.find(params[:id])
    comment_params=params.require(:comment).permit(:user_id, :task_id, :comment)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to project_task_path(@task)
    else
      render :show
  end
end

end


#@comment = Comment.new
