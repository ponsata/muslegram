class UsersController < ApplicationController
before_action :authenticate_user!
  
  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

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
    @messages = @user.messages.paginate(page: params[:page], per_page: 10)
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
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
  
  def user_params
    params.require(:user).permit(:id, :nickname, :email, :image, :profile)
  end
  
end
