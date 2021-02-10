class GrouppostsController < ApplicationController
  
  def new
    @grouppost = Grouppost.new
  end
  
  def create
    
    @grouppost = current_user.groupposts.build(grouppost_params)

    if @grouppost.save
      flash[:success] = '投稿が成功しました。'
      redirect_to group_path(params[:grouppost]['group_id'])
    else
      flash[:danger] = '投稿に失敗しました。'
      redirect_to group_path(params[:grouppost]['group_id'])
    end
  end

  def destroy
    @grouppost = Grouppost.find(params[:id])
    @grouppost.destroy
    
    flash[:success] = '投稿を削除しました。'
    redirect_to group_url
  end
  
  private
  
  def grouppost_params
    params.require(:grouppost).permit(:content, :group_id)
  end
end
