class TweetsController < ApplicationController
  before_action :set_channel, only: [:index, :show, :create]
  before_action :set_channel_users, only: [:index, :show]

  def index
    @tweets = @channel.tweets.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show
    @channel_user = @channel.channel_users.find(params[:id])
    @tweets = @channel_user.tweets.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to channel_tweet_path(@channel, @tweet)
    end
  end

  private

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def set_channel_users
    @channel_users = if params[:search].blank?
                      @channel.channel_users
                    else
                      @channel.channel_users.joins(:user).where('users.name LIKE ?', "%#{params[:search]}%")
                    end
  end

  def tweet_params
    channel_users = ChannelUser.where(user_id: current_user.id, channel_id: @channel.id)
    channel_user_id = channel_users.find_by(administrator: 0)&.id || channel_users.find_by(administrator: 1)&.id
    params.require(:tweet).permit(:text, :tweet_image).merge(channel_user_id: channel_user_id, channel_id: @channel.id)
  end
end
