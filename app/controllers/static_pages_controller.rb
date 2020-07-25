class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @picture = current_user.pictures.build
      @feed_items = current_user.feed.paginate(page: params[:page])
#      @picture.genre_pictures.build
    end
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
