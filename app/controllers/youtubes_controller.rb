class YoutubesController < ApplicationController
  before_action :set_key, only:[:find_videos, :results, :new, :create, :show, :edit, :update]
  before_action :set_youtube, only: [:show, :edit, :update, :destroy]
  
  # GET /youtubes
  # GET /youtubes.json

  
  require 'google/apis/youtube_v3' #YoutubeV3を使用するために、呼び出す
  require 'optimist'
  
  def find_videos(keyword, after: 7.months.ago, before: Time.now)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.youtube[:api_key] 
    keyword = params[:search]
    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 5,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    youtube.list_searches(:snippet, opt)
  end
  
  def results
    @youtubes = find_videos(@keyword)
    youtubes = find_videos(@keyword)
    youtubes.items.each do |item| 
      youtube = Youtube.new
      snippet = item.snippet
      video_id = item.id.video_id
      youtube.channel_id = snippet.channel_id
      youtube.channel_title = snippet.title  
      youtube.video_id = video_id
      youtube.description = snippet.description 
      youtube.save
    end
  end
  def index
    @youtubes = Youtube.all
  end
  # GET /youtubes/1
  # GET /youtubes/1.json
  def show
  end

  # GET /youtubes/new
  def new
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.youtube[:api_key] 

    
  end

  # GET /youtubes/1/edit
  def edit
  end

  # POST /youtubes
  # POST /youtubes.json
  def create
    @youtube = Youtube.new(youtube_params)

    respond_to do |format|
      if @youtube.save
        format.html { redirect_to @youtube, notice: 'Youtube was successfully created.' }
        format.json { render :show, status: :created, location: @youtube }
      else
        format.html { render :new }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtubes/1
  # PATCH/PUT /youtubes/1.json
  def update
    respond_to do |format|
      if @youtube.update(youtube_params)
        format.html { redirect_to @youtube, notice: 'Youtube was successfully updated.' }
        format.json { render :show, status: :ok, location: @youtube }
      else
        format.html { render :edit }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtubes/1
  # DELETE /youtubes/1.json
  def destroy
    @youtube.destroy
    respond_to do |format|
      format.html { redirect_to youtubes_url, notice: 'Youtube was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_youtube
    @youtube = Youtube.find(params[:id])
  end
  def set_key
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.youtube[:api_key] 
  end
  # Only allow a list of trusted parameters through.
  def youtube_params
    params.fetch(:youtube, {})
  end
end
