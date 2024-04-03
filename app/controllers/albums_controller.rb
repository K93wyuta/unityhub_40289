class AlbumsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
  end
end
