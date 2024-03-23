class ChannelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @channel = Channel.all
  end
end
