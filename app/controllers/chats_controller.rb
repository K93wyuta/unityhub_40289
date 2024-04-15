class ChatsController < ApplicationController
  before_action :set_channel, only: [:index, :show, :new, :create]
  before_action :set_chats, only: [:index, :show]

  def index
  end

  def show
    @chat = @channel.chats.find(params[:id])
    @channel_chat_users = @chat.channel_chat_users
    @message = Message.new
    @messages = @chat.messages.includes(:channel_chat_user)
  end

  def new
    @channel_users = @channel.channel_users.where.not(user_id: current_user.id)
    @chat = Chat.new
  end

  def create
    @channel_users = @channel.channel_users.where.not(user_id: current_user.id)
    @chat = Chat.new(chat_params)
    if @chat.save
      add_channel_users_to_chat
      redirect_to channel_chat_path(@chat.channel, @chat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def set_chats
    @chats = @channel.chats.joins(:channel_chat_users)
                     .where(channel_chat_users: { channel_user: current_user.channel_users })
    @chats = @chats.where('chats.name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @chats = @chats.order(created_at: :desc)
  end

  def add_channel_users_to_chat
    (params[:users] || []).each do |user_id|
      @chat.channel_chat_users.create(channel_user_id: find_channel_user(user_id).id) if find_channel_user(user_id)
    end
    @chat.channel_chat_users.create(channel_user_id: find_channel_user(current_user.id).id) if find_channel_user(current_user.id)
  end

  def find_channel_user(user_id)
    ChannelUser.find_by(user_id:, channel_id: @channel.id)
  end

  def chat_params
    params.require(:chat).permit(:name, :chat_image).merge(channel_id: @channel.id)
  end
end
