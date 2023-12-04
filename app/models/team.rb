class Team < ApplicationRecord
  validates :name, presence: true

  # NOTE: наверное стоит убрать капитана
  has_one :user
  has_many :users, through: :TeamMembers
  has_many :eventMembers

  def is_full
    @team.max_count == @team.count
  end
end