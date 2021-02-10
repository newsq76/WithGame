class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @groups = Group.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @group = Group.find(params[:id])
    @newgrouppost = Grouppost.new(:group_id => params[:id])
    @groupposts = Grouppost.where(group_id: params[:id]).page(params[:page]).per(25)
  end
  
  def new 
    @group = Group.new
  end
  
  def create
    @group = current_user.groups.build(group_params)
    
    if @group.save
      flash[:success] = 'Groupが作成されました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'Groupが作成されませんでした。'
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    
    flash[:success] = 'Groupは削除されました。'
    redirect_to root_url
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name)
  end
  
  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
    unless @group
      redirect_to root_url
    end
  end
  
end
