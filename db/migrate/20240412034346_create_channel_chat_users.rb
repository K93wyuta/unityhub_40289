class CreateChannelChatUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_chat_users do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :channel_user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
