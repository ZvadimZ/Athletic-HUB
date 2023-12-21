class Event < ApplicationRecord
  validates :title, :placeUrl, :time, presence: true
  has_many :teams,  dependent: :destroy
  belongs_to :user
end