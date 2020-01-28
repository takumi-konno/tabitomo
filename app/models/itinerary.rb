class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :schedules
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true, length: { maximum: 255 }
  validates :end_date, presence: true, length: { maximum: 255 }
end
