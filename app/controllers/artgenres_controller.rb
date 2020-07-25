class ArtgenresController < ApplicationController
  
  before_action :admin_user, only: [:add,:edit]
    
  def index
    #@artgenre = Artgenre.new
    #@artgenre = current_user.artgenres.build
    @artgenre = Artgenre.all
  end

  def add
    @artgenre = Artgenre.new
    if request.post? then
      @artgenre = Artgenre.create artgenre_params
      redirect_to '/artgenres'
    end
  end

  def show
    @artgenre = Artgenre.find(params[:id])
   # @pictures = @user.pictures.paginate(page: params[:page])
  end
  
#  def create
#    @genre = current_user.artgenres.build(artgenre_params)
#    @genre = Artgenre.new
#    if @genre.save
#      flash[:success] = "アート情報がアップデートされました。"
#      redirect_to '/artgenres'
#    else
#      @feed_items = []
#      render 'index'
#    end
#  end

  def edit
    @artgenre = Artgenre.find(params[:id])
#    if request.patch? then
#      @artgenre.update artgenre_params
#      redirect_to '/artgenres'
#    end  
  end
  
  def update
    @artgenre = Artgenre.find(params[:id])
    if @artgenre.update_attributes(artgenre_params)
      flash[:success] = "ジャンルが更新されました"
      redirect_to @artgenre
    else
      render 'edit'
    end
  end
  
  private
  
    def artgenre_params
      params.require(:artgenre).permit(:name, :memo)
    end
  
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end