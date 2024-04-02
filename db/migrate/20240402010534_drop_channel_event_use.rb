class DropChannelEventUse < ActiveRecord::Migration[7.0]
  def change
    drop_table :channel_event_uses
  end
end
