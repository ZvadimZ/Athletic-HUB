class Team < ApplicationRecord
  validates :name, presence: true

  has_many :user
  has_many :teamMember
  belongs_to :event
  has_many :eventMember
end