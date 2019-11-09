class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end
  
protected
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
  
end
