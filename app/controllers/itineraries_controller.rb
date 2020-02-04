class ItinerariesController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :destroy]
  before_action :correct_user_itinerary, only: [:edit, :destroy]
  
  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @itinerary = current_user.itineraries.build
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

  def edit
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update(itinerary_params)
      flash[:success] = 'しおりを更新しました。'
      redirect_to @itinerary
    else
      flash.now[:danger] = 'しおりの更新に失敗しました'
      render 'itineraries/edit'
    end
  end
  
  def destroy
    @user = @itinerary.user
    @itinerary.destroy
    flash[:success] = 'しおりを削除しました。'
    redirect_to @user
  end
  
  def search
    @itineraries = Itinerary.search(params[:search]).page(params[:page]).per(9)
    render :layout => "second_layout"
  end

  
  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :image, :start_date, :end_date)
  end
  
  def correct_user_itinerary
    @itinerary = current_user.itineraries.find_by(id: params[:id])
    unless @itinerary
      redirect_to root_url
    end
  end
  
end
