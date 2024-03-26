class AddAdministratorToChannelUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :channel_users, :administrator, :boolean
  end
end
