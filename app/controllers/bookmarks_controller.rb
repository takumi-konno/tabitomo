class BookmarksController < ApplicationController
  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    current_user.like(itinerary)
    flash[:success] = 'しおりをブックマークしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    itinerary = Itinerary.find(params[:itinerary_id])
    current_user.unlike(itinerary)
    flash[:success] = 'しおりのブックマークを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
