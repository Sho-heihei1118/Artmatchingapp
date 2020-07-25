module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "アーティストと繋がれるサイト"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
