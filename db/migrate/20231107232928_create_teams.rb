class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|

      t.string :name, null: false
      t.integer :count
      t.references :user
      t.timestamps
    end

    create_table :team_members do |t|

      t.references :user
      t.references :team
      t.timestamps
    end

    create_table :event_members do |t|

      t.references :event
      t.references :team
      t.timestamps
    end

  end
end
