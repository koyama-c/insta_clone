class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])   
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page]) 
    @comment = Comment.new
    @posts.each do |post|
    @comments = post.comments
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
end
