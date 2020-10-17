class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit, :update] 

  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
    @playlist_youtubes = @user.playlists.map{|playlist| playlist.youtube}
  end
  
  private
  
  def user_params
    params.require(:user).permit(:id, :nickname, :email, :image, :profile)
  end
  
end
