class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @itineraries = @user.itineraries.order(id: :desc).page(params[:page]).per(9)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user.destroy
    
    flash[:success] = 'ユーザは正常に削除されました'
    redirect_to root_path
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page]).per(9)
    counts(@user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
  end
  
  def correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_url
    end
  end
  
end
