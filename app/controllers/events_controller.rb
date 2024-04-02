class EventsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    if params[:date]
      @date = Date.parse(params[:date])
      @events = Event.where(date_start: @date.beginning_of_day..@date.end_of_day)
    else
      @events = Event.all
    end
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
        channel_user = ChannelUser.find_by(user_id:, channel_id: @channel.id)
        @event.channel_event_users.create(channel_user_id: channel_user.id) if channel_user
      end
      redirect_to channel_event_path(@event.channel, @event)
    else
      @channel_users = User.all
      render :new
    end
  end

  def edit
    @channel = Channel.find(session[:channel_id])
    @channel_users = @channel.channel_users.where(administrator: false)
    @event = Event.find(params[:id])
  end

  def update
    @channel = Channel.find(session[:channel_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      @event.channel_event_users.destroy_all
      (params[:users] || []).each do |user_id|
        channel_user = ChannelUser.find_by(user_id:, channel_id: @channel.id, administrator: false)
        @event.channel_event_users.create(channel_user_id: channel_user.id) if channel_user
      end
      redirect_to channel_event_path(params[:id])
    else
      @channel_users = User.all
      render :edit
    end
  end

  def show
    @channel = Channel.find(session[:channel_id])
    @event = @channel.events.find(params[:id])
    @channel_event_users = @event.channel_event_users
  end

  def destroy
    @channel = Channel.find(session[:channel_id])
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to channel_path(@channel)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date_start, :date_end, :time_start, :time_end, :place,
                                  :detail).merge(channel_id: @channel.id)
  end
end
