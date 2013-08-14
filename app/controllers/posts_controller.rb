class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
#  def create
  #  render text: params[:post].inspect
#    @post = Post.new(params[:post].permit(:title, :text))
#    @post.save
#   redirect_to @post
#  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
#    @posts = Post.all
#             Post.order("id").last          
    @posts = Post.page params[:page]
  end
  
  def create
    @post = Post.new(params[:post].permit(:title, :text, :time)) 
#    @post = Post.new(post_params) 
#    @post.save
#    redirect_to @post
     if @post.save
       redirect_to @post
     else
       render 'new'
     end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text, :time))
     redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
 
private
  #use callbacks to share common setup or constraints between actions
#  def set_post
#    @post = Post.find(params|:id|)
#  end
  
  def post_params
    params.require(:post).permit(:title, :text)
  end

  
end
