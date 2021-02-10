class ToppagesController < ApplicationController
  def index
    if logged_in?
      @groups = Group.order(id: :desc).page(params[:page]).per(25)
      @favoritegroups = current_user.favoritegroups.page(params[:page])
    end
  end
end
