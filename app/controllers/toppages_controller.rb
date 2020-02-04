class ToppagesController < ApplicationController
  layout "second_layout"
  def index
    @itineraries = Itinerary.all.order(id: :desc).page(params[:page]).per(9)
  end
end
