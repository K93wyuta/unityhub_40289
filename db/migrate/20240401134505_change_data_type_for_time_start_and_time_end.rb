class ChangeDataTypeForTimeStartAndTimeEnd < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :time_start, :time
    change_column :events, :time_end, :time
  end
end
