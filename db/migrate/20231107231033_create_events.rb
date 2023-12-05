class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|

      t.string :title, null: false
      t.string :placeUrl, null: false
      t.date :time, null: false
      t.integer :count_members
      t.belongs_to :user, foreign_key: true
      t.datetime :registration_start_time
      t.datetime :registration_close_time
      t.text :text
      t.string :imagePath
      t.timestamps
    end
  end
end
