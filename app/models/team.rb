class Team < ApplicationRecord
  validates :name, presence: true

  has_one :user
  has_many :teamMember
  has_many :eventMember
end