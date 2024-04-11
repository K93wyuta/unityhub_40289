class ChannelEventUsersController < ApplicationController
  before_action :set_event, :set_channel_user, only: [:create, :destroy]

  def create
    existing_channel_event_user = ChannelEventUser.find_by(channel_user_id: @channel_user.id, event_id: @event.id)
    if existing_channel_event_user.blank?
      @channel_event_user = ChannelEventUser.create(channel_user_id: @channel_user.id, event_id: @event.id)
      flash[:notice] = 'Successfully joined the event'
    else
      flash[:alert] = 'Already joined this event.'
    end
    redirect_to channel_event_path(@event.channel, @event)
  end

  def destroy
    @channel_event_user = ChannelEventUser.find_by(channel_user_id: @channel_user.id, event_id: @event.id)
    if @channel_event_user.present?
      @channel_event_user.destroy
    end
    redirect_to channel_event_path(@event.channel, @event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_channel_user
    @channel_user = ChannelUser.find_by(user_id: current_user.id, channel_id: params[:channel_id])
  end
end