class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :team
  has_many :teamMember
  has_many :event
end