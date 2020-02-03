class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :reverses_of_bookmarks, class_name: 'Bookmark', dependent: :destroy
  has_many :added_bookmarks, through: :reverses_of_bookmarks, source: :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true, length: { maximum: 255 }
  validates :end_date, presence: true, length: { maximum: 255 }
  
  def self.search(search)
    if search
      Itinerary.where(['title LIKE ?', "%#{search}%"])
    else
      Itinerary.all
    end
  end
  
  mount_uploader :image, ImageUploader
  
end
