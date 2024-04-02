class ChangeDataTypeForTimeStartAndTimeEnd < ActiveRecord::Migration[7.0]
  def up
    remove_column :events, :time_start
    remove_column :events, :time_end
    add_column :events, :time_start, :time
    add_column :events, :time_end, :time
  end
  
  def down
    remove_column :events, :time_start
    remove_column :events, :time_end
    # 以下に元のtypeを指定します。例えば:datetimeとします
    add_column :events, :time_start, :元のデータ型
    add_column :events, :time_end, :元のデータ型
  end
end
