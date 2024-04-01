class EventsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    @events = Event.all
  end
end
