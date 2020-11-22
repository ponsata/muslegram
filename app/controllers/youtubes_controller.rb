class YoutubesController < ApplicationController
 
  # GET /youtubes
  # GET /youtubes.json
  before_action :authenticate_user!, only: [:find_videos, :results] 
  
  require 'google/apis/youtube_v3' #YoutubeV3を使用するために、呼び出す
  require 'optimist'
  
  def find_videos(keyword, after: 2.years.ago, before: Time.now)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.youtube[:api_key] 
   
    if params[:search].present?
      keyword = params[:search]
      next_page_token = nil
      opt = {
        q: keyword,
        type: 'video',
        max_results: 12,
        order: :date,
        page_token: next_page_token,
        published_after: after.iso8601,
        published_before: before.iso8601
      }
      youtube.list_searches(:snippet, opt)
    else 
      return 
    end
    
  end

  def results
    @youtubes = find_videos(@keyword)
    if @youtubes.blank? 
      flash[:alert] = " 該当する動画がありません"
    else
      @youtubes.items.each do |item| 
        youtube = Youtube.new
        snippet = item.snippet
        video_id = item.id.video_id
        youtube.channel_id = snippet.channel_id
        youtube.channel_title = snippet.channel_title  
        youtube.title = snippet.title  
        youtube.video_id = video_id
        youtube.description = snippet.description 
        youtube.save
      end
    end  
  end

  def index
    @youtubes = Youtube.all.includes(:playlists)
    if user_signed_in?
      @playlist = current_user.playlists.includes(user: :youtube)
    end
  end  
end
