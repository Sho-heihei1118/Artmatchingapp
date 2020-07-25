class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  
  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures.paginate(page: params[:page])
#    @artgenres = @pictures.artgenres
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "アートマッチングへようこそ!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
#   @users = User.all
#   @random_users = User.order("RANDOM()").all    
#   @pictures = Picture.all
#   @pictures = @pics.pictures.paginate(page: params[:page])
    @random_pics = Picture.order("RANDOM()").search(params[:search])
#    @random_pics = @items.uniq! 
    @artgenres = Artgenre.all
#    @users = User.where(activated: true).paginate(page: params[:page]).search(params[:search])
#    @users = User.search(params[:search])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name,:email,:carreer,:password,:password_confirmation,:picture)
    end
    
    # beforeアクション

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
