class PlaylistsController < ApplicationController
  protect_from_forgery except: [:create, :destroy]
  def create 
    @playlist = current_user.playlists.build(youtube_id: params[:youtube_id])
    @playlist.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.playlists.find_by(youtube_id: params[:youtube_id]).destroy!
    redirect_back(fallback_location: root_path)
  end

end
