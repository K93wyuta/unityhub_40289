class CreateChannelEventUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_event_users do |t|
      t.references :channel_user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
  end
end
