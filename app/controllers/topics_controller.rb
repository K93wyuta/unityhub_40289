class TopicsController < ApplicationController
  before_action :set_channel, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_channel_user, only: [:create, :update]
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to channel_path(@channel)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to channel_path(@channel)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
    redirect_to channel_path(@channel)
  end

  private

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def set_channel_user
    @channel_user = ChannelUser.find_by(user_id: current_user.id, channel_id: @channel.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def correct_user
    @channel = Channel.find(session[:channel_id])
    redirect_to channel_path(@channel) unless @topic.channel_user.user == current_user
  end

  def topic_params
    params.require(:topic).permit(:title, :text).merge(channel_id: @channel.id, channel_user_id: @channel_user.id)
  end
end
