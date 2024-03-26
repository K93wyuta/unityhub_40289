class RemoveAdministratorIdFromChannels < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :administrator_id, :integer
  end
end
