class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|

      t.string :name, null: false
      t.integer :max_count, null: false
      t.integer :capacity, default: 0
      t.belongs_to :event, foreign_key: true
      t.timestamps
    end

    create_table :team_members do |t|
      t.belongs_to :user
      t.belongs_to :team
      t.timestamps
    end

  end
end
