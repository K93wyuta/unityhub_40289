class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @channel = Channel.find(session[:channel_id])
  end
end
