class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
  end

  #this added from github.com/rails/rails/blob/master/guides/source/getting_started.md
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
  
end
