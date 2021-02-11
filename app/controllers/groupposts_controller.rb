class GrouppostsController < ApplicationController
  
  def new
    @grouppost = Grouppost.new
  end
  
  def create
    
    @grouppost = current_user.groupposts.build(grouppost_params)

    if @grouppost.save
      redirect_to group_path(params[:grouppost]['group_id'])
    else
      redirect_to group_path(params[:grouppost]['group_id'])
    end
  end

  def destroy
    @grouppost = Grouppost.find(params[:id])
    @grouppost.destroy
    
    redirect_to group_url
  end
  
  private
  
  def grouppost_params
    params.require(:grouppost).permit(:content, :group_id)
  end
end
