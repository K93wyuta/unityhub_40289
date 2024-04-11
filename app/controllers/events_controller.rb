class EventsController < ApplicationController
  before_action :set_channel, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  before_action :set_event, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_channel_users, only: [:new, :create, :edit, :update]

  def index
    if params[:date]
      @date = Date.parse(params[:date])
      @events = @channel.events.where(date_start: @date.beginning_of_day..@date.end_of_day)
    else
      @events = @channel.events
    end
  end

  def new
    @event = Event.new
  end

  def create
    current_channel_user = ChannelUser.find_by(user_id: current_user.id)
    @event = @channel.events.build(event_params.merge(channel_user: current_channel_user))
    if @event.save
      (params[:users] || []).each do |user_id|
        channel_user = ChannelUser.find_by(user_id:, channel_id: @channel.id)
        @event.channel_event_users.create(channel_user_id: channel_user.id) if channel_user
      end
      redirect_to channel_event_path(@event.channel, @event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @event.update(event_params)
      @event.channel_event_users.destroy_all
      (params[:users] || []).each do |user_id|
        channel_user = ChannelUser.find_by(user_id:, channel_id: @channel.id)
        @event.channel_event_users.create(channel_user_id: channel_user.id) if channel_user
      end
      redirect_to channel_event_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @channel_event_users = @event.channel_event_users
  end

  def destroy
    @event.destroy
    redirect_to channel_path(@channel)
  end

  private

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def set_event
    @event = @channel.events.find(params[:id])
  end

  def correct_user
    @channel = Channel.find(session[:channel_id])
    redirect_to channel_path(@channel) unless @event.channel_user.user == current_user
  end

  def set_channel_users
    @channel_users = @channel.channel_users
  end

  def event_params
    params.require(:event).permit(:name, :date_start, :date_end, :time_start, :time_end, :place,
                                  :detail).merge(channel_id: @channel.id)
  end
end
