class TweetsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    @tweets = @channel.tweets.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @channel = Channel.find(session[:channel_id])
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to channel_tweets_path(@channel)
    else
      p @tweet.errors.full_messages
      render :index
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :tweet_image).merge(channel_user_id: ChannelUser.find_by(user_id: current_user.id,channel_id: @channel.id).id, channel_id: @channel.id)
  end
end
