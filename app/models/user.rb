class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: {maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :itineraries
  has_many :bookmarks
  has_many :likes, through: :bookmarks, source: :itinerary
  has_many :schedules, through: :itineraries
  
  def like(itinerary)
    self.bookmarks.find_or_create_by(itinerary_id: itinerary.id)
  end
  
  def unlike(itinerary)
    bookmark = self.bookmarks.find_by(itinerary_id: itinerary.id)
    bookmark.destroy if bookmark
  end
  
  def likes?(itinerary)
    self.likes.include?(itinerary)
  end
end
