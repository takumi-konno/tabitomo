class ToppagesController < ApplicationController
  def index
    @itineraries = Itinerary.all.order(id: :desc).page(params[:page]).per(9)
  end
end
