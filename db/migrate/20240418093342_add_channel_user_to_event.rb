class AddChannelUserToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :channel_user, :references
  end
end
