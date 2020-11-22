class MessagesController < ApplicationController
  
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all.includes(:user, :youtube)
    @user = current_user
  end

  def show
    @user = @message.user
    @youtube = @message.youtube
    @comment = Comment.new
    @comments = @message.comments
  end


  def new 
    @youtube_id = params[:youtube_id]
    @video_id = params[:video_id]
    @channel_title = params[:channel_title]
    @title = params[:title]
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.new
  end

  def update
   if @message.update(message_params)
      redirect_to messages_path
    else
      redirect_to edit_message_path
    end
  end

  def destroy
    if @message.destroy 
      redirect_to messages_path
    else 
      redirect_back(fallback_location: root_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:title, :explanation).merge(user_id: current_user.id, youtube_id: params[:youtube_id] )
    end
end
