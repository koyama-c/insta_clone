class PagesController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end
  
  protected

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
end
