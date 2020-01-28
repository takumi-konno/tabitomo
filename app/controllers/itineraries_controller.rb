class ItinerariesController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def create
    @itinerary = current_user.itineraries.build(itinerary_params)
    if @itinerary.save
      flash[:success] = 'しおりを作成しました。'
      redirect_to @itinerary
    else
      flash.now[:danger] = 'しおりの作成に失敗しました'
      render 'itineraries/new'
    end
  end

  def new
    @itinerary = current_user.itineraries.build
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def destroy
    @itinerary.destroy
    flash[:success] = 'しおりを削除しました。'
    redirect_to root_url
  end

  def update
    @itinerary = current_user.itineraries.build(itinerary_params)
    
    if @itinerary.save
      flash[:success] = 'しおりを更新しました。'
      redirect_to @itinerary
    else
      flash.now[:danger] = 'しおりの更新に失敗しました'
      render 'itineraries/edit'
    end
  end
  
  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :image, :start_date, :end_date)
  end
  
  def correct_user
    @itinerary = current_user.itineraries.find_by(id: params[:id])
    unless @itinerary
      redirect_to root_url
    end
  end
  
end