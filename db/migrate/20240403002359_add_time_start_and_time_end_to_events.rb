class AddTimeStartAndTimeEndToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :time_start, :datetime
    add_column :events, :time_end, :datetime
  end
end
