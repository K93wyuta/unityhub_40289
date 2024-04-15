class MessagesController < ApplicationController
  before_action :set_channel
  before_action :set_chat
  before_action :set_channel_users

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to channel_chat_messages_path(@channel, @chat)
    else
      render :new
    end
  end

  private

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def set_chat
    @chat = @channel.chats.find(params[:chat_id])
  end

  def set_channel_users
    @channel_users = @channel.channel_users
  end

  def message_params
    channel_user = current_user.channel_users.where(channel: @channel).first
    channel_chat_user = channel_user.channel_chat_users.first
    params.require(:message).permit(:content, :message_image).merge(channel_chat_user_id: channel_chat_user.id, chat_id: @chat.id)
  end
end
