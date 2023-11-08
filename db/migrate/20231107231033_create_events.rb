class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|

      t.string :name, null: false
      t.string :place, null: false
      t.string :time, null: false
      t.integer :count_members
      t.references :user
      t.string :registration_start_time
      t.string :registration_close_time
      t.text :description
      t.timestamps
    end
  end
end
