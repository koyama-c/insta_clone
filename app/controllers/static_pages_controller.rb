class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page]) 
    @comment = Comment.new
    @comments = @post.comments
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
