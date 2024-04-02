class ChannelEventUsersController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    channel_user = ChannelUser.find_by(user_id: current_user.id, channel_id: params[:channel_id])
    existing_channel_event_user = ChannelEventUser.find_by(channel_user_id: channel_user.id, event_id: @event.id)

    if existing_channel_event_user.blank?
      @channel_event_user = ChannelEventUser.create(channel_user_id: channel_user.id, event_id: @event.id)
      redirect_to channel_event_path(@event.channel, @event), notice: 'Successfully joined the event.'
    else
      redirect_to channel_event_path(@event.channel, @event), alert: 'Already joined this event.'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    channel_user = ChannelUser.find_by(user_id: current_user.id, channel_id: params[:channel_id])
    @channel_event_user = ChannelEventUser.find_by(channel_user_id: channel_user.id, event_id: @event.id)

    if @channel_event_user.present?
      @channel_event_user.destroy
      redirect_to channel_event_path(@event.channel, @event)
    else
      redirect_to channel_event_path(@event.channel, @event)
    end
  end
end
