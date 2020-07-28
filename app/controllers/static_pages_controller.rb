class StaticPagesController < ApplicationController
  def home
    if logged_in? #ログイン状態時のホーム画面
      @picture = current_user.pictures.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
