class ToppagesController < ApplicationController
  def index
    @itineraries = Itinerary.all.order(id: :desc)
  end
end
