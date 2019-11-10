class PostsController < ApplicationController
 before_action :correct_user,   only: :destroy    

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to home_url
    else
      @feed_items = []        
      redirect_to home_path
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || home_path      
  end
  
private

  def post_params
     params.require(:post).permit(:content, :picture)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to home_path if @post.nil?
  end
end
