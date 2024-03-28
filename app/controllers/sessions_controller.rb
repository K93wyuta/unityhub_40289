class SessionsController < ApplicationController
  def new
  end

  def create
    identification = params[:identification]
    password = params[:password]
    channel = Channel.find_by(id: params[:channel_id])

    return unless channel && channel.identification == identification && channel.authenticate(password)

    session[:channel_id] = channel.id
    redirect_to channel_path(channel.id)
  end
end
