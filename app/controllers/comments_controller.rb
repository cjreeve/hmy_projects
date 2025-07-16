class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    if @comment.save
      redirect_to @project, notice: 'Comment was successfully created.'
    else
      render 'projects/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_name, :details)
  end
end
