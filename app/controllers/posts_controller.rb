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

# http://stackoverflow.com/questions/15822988/keep-http-authentication-private-in-a-public-github-repo
# http://stackoverflow.com/questions/13294194/rails-how-to-store-mailer-password-safely#new-answer  
# also do comments_controller.rb
#  http_basic_authenticate_with name: ENV['BLOG6_USERNAME'], password: ENV['BLOG6_PASSWORD'], except: [:index, :show]
  
# OK, so this is a blog & not a message board - so last created posts really should appear first instead of most recently commented
  def index
#    @posts = Post.all
#             Post.order("id").last 
#    @posts = Post.page params[:page]     #### this is normal paginated posting in FIFO order of posts
# this displays posts with the ones last commented on first - problem - new posts w/o comments still appear at end.    
    @posts = Post.includes(:comments).order("comments.created_at desc", "posts.created_at desc").page params[:page]
  end
  
  def show
    @post = Post.find(params[:id])
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
