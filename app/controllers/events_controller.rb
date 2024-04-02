class EventsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    @events = Event.all
  end

  def new
    @channel = Channel.find(session[:channel_id])
    @channel_users = @channel.channel_users.where(administrator: false)
    @event = Event.new
  end

  def create
    @channel = Channel.find(session[:channel_id])
    @event = Event.new(event_params)
    if @event.save
      (params[:users] || []).each do |user_id|
        channel_user = ChannelUser.find_by(user_id: user_id, channel_id: @channel.id)
        @event.channel_event_users.create(channel_user_id:channel_user.id) if channel_user
      end
    redirect_to channel_events_path(@channel)
    else
      @channel_users = User.all
      render :new
    end
  end

  def show
    @channel = Channel.find(session[:channel_id])
    @event = @channel.events.find(params[:id])
    @channel_event_users = @event.channel_event_users
  end

  private

  def event_params
    params.require(:event).permit(:name, :date_start, :date_end, :time_start, :time_end, :place, :detail).merge(channel_id: @channel.id)
  end
end
