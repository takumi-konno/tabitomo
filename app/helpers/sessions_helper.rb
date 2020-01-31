module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def current_user_itinerary
    @current_itinerary ||= current_user.itineraries.find_by(id: params[:id])
  end
  
  def correct_user_itinerary?
    !!current_user_itinerary
  end
  
  def current_user_schedule
    @current_schedule ||= current_user.schedules.find_by(id: params[:id])
  end
  
  def correct_user_schedule?
    !!current_user_schedule
  end
  
end