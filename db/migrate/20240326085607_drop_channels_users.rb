class DropChannelsUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :channels_users
  end
end
