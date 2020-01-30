class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def counts(user)
    @count_itineraries = user.itineraries.count
    @count_likes = user.likes.count
  end
  
end
