class SchedulesController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :destroy]
  before_action :correct_user_schedule, only: [:edit, :destroy]
  
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @schedule = @itinerary.schedules.build
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @schedule = @itinerary.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = '予定を作成しました。'
      redirect_to @itinerary
    else
      flash.now[:danger] = '予定の作成に失敗しました。'
      render 'schedules/new'
    end
  end

  def edit
  end

  def update
    @schedule = Schedule.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    if @schedule.update(schedule_params)
      flash[:success] = '予定を編集しました。'
      redirect_to @itinerary
    else
      flash.now[:danger] = '予定の編集に失敗しました。'
      render 'schedules/edit'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @itinerary = @schedule.itinerary
    @schedule.destroy
    flash[:success] = '予定を削除しました。'
    redirect_to @itinerary
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:itinerary_id, :date, :title, :start_time, :end_time, :supplement, :image)
  end
  
  def correct_user_schedule
    @schedule = current_user.schedules.find_by(id: params[:id])
    unless @schedule
      redirect_to root_url
    end
  end
  
end
