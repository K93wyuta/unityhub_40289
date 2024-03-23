class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name,               null: false
      t.string :identification,     null: false
      t.string :password_digest,    null: false
      t.text :introduction
      t.references :administrator,  null: false,foreign_key:{ to_table: :users }
      t.timestamps
    end
  end
end
