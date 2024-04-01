class TweetsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    if params[:search].blank?
      @channel_users = @channel.channel_users.where(administrator: false)
    else
      @channel_users = @channel.channel_users.joins(:user).where('users.name LIKE ?', "%#{params[:search]}%").where(administrator: false)
    end
    @tweets = @channel.tweets.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show
    @channel = Channel.find(session[:channel_id])
    @channel_user = @channel.channel_users.find(params[:id])
    
    if params[:search].blank?
      @channel_users = @channel.channel_users.where(administrator: false)
    else
      @channel_users = @channel.channel_users.joins(:user).where('users.name LIKE ?', "%#{params[:search]}%").where(administrator: false)
    end
    @tweets = @channel_user.tweets.order(created_at: :desc)
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
    channel_users = ChannelUser.where(user_id: current_user.id, channel_id: @channel.id)
    channel_user_id = channel_users.find_by(administrator: 0)&.id || channel_users.find_by(administrator:1)&.id
    params.require(:tweet).permit(:text, :tweet_image).merge(channel_user_id: channel_user_id, channel_id: @channel.id)
  end
end