class CommentsController < ApplicationController
  
  def create
    @comment = @task.comments.new
  end

end
