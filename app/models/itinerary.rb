class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :reverses_of_bookmarks, class_name: 'Bookmark'
  has_many :added_bookmarks, through: :reverses_of_bookmarks, source: :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true, length: { maximum: 255 }
  validates :end_date, presence: true, length: { maximum: 255 }
end
