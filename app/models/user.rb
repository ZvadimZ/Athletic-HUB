class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :teamMembers
  has_many :teams, through: :teamMembers

end