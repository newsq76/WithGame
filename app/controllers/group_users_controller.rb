class GroupUsersController < ApplicationController
  before_action :require_user_logged_in

  def create
    group = Group.find(params[:group_id])
    current_user.like(group)
    redirect_to root_path
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.unlike(group)
    redirect_to root_path
  end
end