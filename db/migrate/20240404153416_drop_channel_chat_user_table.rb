class DropChannelChatUserTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :channel_chat_users
  end
end
