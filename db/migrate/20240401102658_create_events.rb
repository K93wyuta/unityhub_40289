class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name,               null: false
      t.date :date_start,               null: false
      t.date :date_end,               null: false
      t.date :time_start,               null: false
      t.date :time_end,               null: false
      t.string :place
      t.text :detail
      t.references :channel, null: false, foreign_key: true
      t.timestamps
    end
  end
end
