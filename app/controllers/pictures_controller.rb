class PicturesController < ApplicationController
  before_action :logged_in_user, only: [:create,:edit,:update,:destroy]
  before_action :correct_user, only: :destroy
  
  def new #アート作品投稿ページ
    @picture = Picture.new
    @genres = @picture.genre_pictures
  end
  
  def create #アート作品投稿
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = "アート情報がアップデートされました。"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
    logger.debug @picture.errors.inspect #logger#
  end
  
  def edit #アート作品編集ページ
    @picture = Picture.find(params[:id])
  end

  def update　#アート作品編集
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      flash[:success] = "Picture updated"
      redirect_to user_pictures_path(current_user)
    else
      render 'edit'
    end
  end
  
  def destroy　#アート作品削除
    @picture.destroy
    flash[:success] = "あなたのアート作品を1件消去しました"
    redirect_to request.referrer || user_pictures_path(current_user) 
  end
  

  private

    def picture_params #ストロングパラメータ
      params.require(:picture).permit(:pic_title, :picture, :pic_description, :pic_created_date,{ :artgenre_ids=> [] })
    end

    def correct_user #ユーザー確認
      @picture = current_user.pictures.find_by(id: params[:id])
      redirect_to user_pictures_path(current_user) if @picture.nil?
    end
end