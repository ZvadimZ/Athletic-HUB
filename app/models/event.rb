class Event < ApplicationRecord
  validates :name, :place, :time, presence: true
  has_many :team
  has_many :eventMember
  belongs_to :user
end