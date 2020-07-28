class ArtgenresController < ApplicationController
  
  #before_action :admin_user, only: [:add,:edit] 管理者権限なしでジャンル追加編集を行えるようコメントアウト
    
  def index #ジャンルの一覧表示
    @artgenre = Artgenre.all
  end

  def add #ジャンルの追加
    @artgenre = Artgenre.new
    if request.post? then
      @artgenre = Artgenre.create artgenre_params
      redirect_to '/artgenres'
    end
  end

  def show #各ジャンルの絵の一覧表示
    @artgenre = Artgenre.find(params[:id])
  end
  
  def edit #ジャンルの編集ページ
    @artgenre = Artgenre.find(params[:id])
  end
  
  def update #ジャンルの更新
    @artgenre = Artgenre.find(params[:id])
    if @artgenre.update_attributes(artgenre_params)
      flash[:success] = "ジャンルが更新されました"
      redirect_to @artgenre #データ更新/削除が必要な場合はredirect_to
    else
      render 'edit' #ログインや入力形式に失敗した場合などはrender
    end
  end
  
  private
  
  　# ジャンルのストロングパラメータ
    def artgenre_params
      params.require(:artgenre).permit(:name, :memo)
    end
  
    # 管理者かどうか確認(#トップでコメントアウト済みのため動作しない)
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end