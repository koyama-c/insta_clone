class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    unless @post.iine?(current_user)
      @post.iine(current_user)
      @post.reload 
      @post.create_notification_like(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @post = Like.find(params[:id]).post
    if @post.iine?(current_user)
      @post.uniine(current_user)
      @post.reload      
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end    
  end
end