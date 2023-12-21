class Team < ApplicationRecord
  validates :name, presence: true

  has_many :teamMembers, dependent: :destroy
  has_many :users, through: :teamMembers
  belongs_to :event

  def is_full
    @team.capacity == @team.max_count
  end

  def auto_create(event_id, teams_count, count)
    i = 1
    while i <= teams_count
      Team.create(name: "Команда №#{i}", max_count: count, event_id: event_id)
      i += 1
    end
  end

end