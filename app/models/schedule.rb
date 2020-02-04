class Schedule < ApplicationRecord
  belongs_to :itinerary
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :date, presence: true, length: { maximum: 255 }
  validates :start_time, presence: true, length: { maximum: 255 }
  validates :end_time, presence: true, length: { maximum: 255 }
  mount_uploader :image, ImageUploader
end
