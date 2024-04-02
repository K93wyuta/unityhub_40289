class TopicsController < ApplicationController

  def new
    @channel = Channel.find(session[:channel_id])
    @topic = Topic.new
  end

  def create
    @channel = Channel.find(session[:channel_id])
    @channel_user = ChannelUser.find_by(user_id: current_user.id, channel_id: @channel.id, administrator: false)
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to channel_path(@channel)
    else
      @channel = Channel.find(session[:channel_id])
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :text).merge(channel_id: @channel.id,channel_user_id: @channel_user.id)
  end
end
