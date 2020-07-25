class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :genre_pictures, dependent: :destroy
  has_many :artgenres, through: :genre_pictures
  accepts_nested_attributes_for :genre_pictures, allow_destroy: true
  default_scope -> {order(pic_created_date: :desc)}
  validates :user_id, presence: true
  validates :pic_title, presence: true, length: { maximum: 30 }
  validates :picture, presence: true
  validates :pic_description, length: { maximum: 140 }
  validates :pic_created_date, presence: true
  validate :validation_pic_size #自作バリデーション

  def self.search(search) #ここでのself.はPicture.を意味する
    if search
#      split_keyword = search.split(/[[:blank:]]+/)
#      split_keyword.each do |keyword|  # 分割したキーワードごとに検索
#        next if keyword == "" 
        where(['pic_title LIKE ? OR pic_description LIKE?',"%#{search}%","%#{search}%"]) # 部分一致で検索 
#      end 
    else
      all #全て表示。#User.は省略
    end
  end
  
  private

  def validation_pic_size   # アップロード画像のサイズを検証する
    if picture.size > 5.megabytes
      errors.add(:picture, "5MBより小さいファイルサイズにしてください")
    end
  end
  
end

