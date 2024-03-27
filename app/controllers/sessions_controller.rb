class SessionsController < ApplicationController
  def new
  end
  
  def create
    identification = params[:identification]
    password = params[:password]
    channel = Channel.find_by(identification:identification)

    if channel && channel.authenticate(password)
      session[:channel_id] = channel.id
      redirect_to channel_path(channel.id)
    end
  end
end
