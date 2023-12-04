class Event < ApplicationRecord
  validates :name, :place, :time, presence: true
  has_many :teams, through: :eventMembers
  has_many :eventMembers
  belongs_to :user
end