# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = :ja
User.create!(name:  "Example User", email: "example@railstutorial.org",
              password: "foobar", password_confirmation: "foobar", admin: true, carreer: "幼少期より油絵やポップアートに興味を持ち、我流で絵を学んできました。独特の空気感を絵に表現できたらいいと思っています。")

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name, email: email,
               password: password, password_confirmation: password, carreer: "趣味で絵を描いています。年に2～3点の作品を作っています。イベント展示や絵の購入、絵の依頼等ありましたらご気軽に連絡ください。お待ちいたしております。")
end

genname01  = "水彩絵"
memo01 = "水彩絵の具で描いたアート"
Artgenre.create!(name:  genname01, memo: memo01)

genname02  = "油絵"
memo02 = "油絵具で描いたアート"
Artgenre.create!(name:  genname02, memo: memo02)

genname03  = "アクリル絵"
memo03 = "アクリル絵の具で描いたアート"
Artgenre.create!(name:  genname03, memo: memo03)

genname04  = "デジタルアート"
memo04 = "PCでアートツール等を用いて描いたアート"
Artgenre.create!(name:  genname04, memo: memo04)

genname05  = "その他"
memo05 = "その他のアート作品"
Artgenre.create!(name:  genname05, memo: memo05)

users = User.order(:created_at).take(4)
title01 = "絵画(サンプル01)"
description01 = "構図などの下書きから絵の具の色合いまで製作期間に２年をかけた作品です。その場の空気を切り取って伝えることに重点を置き、写実的に仕上げてみました。綺麗な色だけでなく、汚れやこすれをうまく表現できたと実感しています。"
users.each { |user| user.pictures.create!(pic_title: title01,
                                            picture: open("#{Rails.root}/app/assets/images/IMG_4547.JPG"), 
                                            pic_description: description01,
                                            pic_created_date: "2020-01-10",
                                             artgenre_ids: [1])}

title02 = "絵画(サンプル02)"
description02 = "ふとした瞬間に筆を取り、一気に描き上げた作品です。自分の直観に従い、感じるままに筆を滑らせて描いてみました。作品のコンセプトであるスピード感とマッチして好みの作品です。"
users.each { |user| user.pictures.create!(pic_title: title02,
                                            picture: open("#{Rails.root}/app/assets/images/IMG_2149.JPG"), 
                                            pic_description: description02,
                                            pic_created_date: "2020-01-11",
                                             artgenre_ids: [4])}
                                             
title03 = "絵画(サンプル03)"
description03 = "被写体のキリンに一目ぼれして描きました。動物の野性味やキリンの心優しい部分を瞳を特徴的に描くことで表現しました。周りに幸せオーラ的なものが醸し出されている感じです。"
users.each { |user| user.pictures.create!(pic_title: title03,
                                            picture: open("#{Rails.root}/app/assets/images/IMG_2146.JPG"), 
                                            pic_description: description03,
                                            pic_created_date: "2020-01-13",
                                             artgenre_ids: [3])}
                                             
title04 = "絵画(サンプル04)"
description04 = "夢に見た映像をそのまま絵に落とし込んでみました。ファンタジーな要素とセピアな感じを出せたかと思います。"
users.each { |user| user.pictures.create!(pic_title: title04,
                                            picture: open("#{Rails.root}/app/assets/images/IMG_4553.JPG"), 
                                            pic_description: description04,
                                            pic_created_date: "2020-01-14",
                                             artgenre_ids: [2])}
                                             
title05 = "絵画(サンプル05)"
description05 = "スイーツのポップなイメージとあえて離れた印象のダークな色合いを合わせてみました。個人的にはかなりかわいく仕上げることができたと思っています。"
users.each { |user| user.pictures.create!(pic_title: title05,
                                            picture: open("#{Rails.root}/app/assets/images/IMG_2254.JPG"), 
                                            pic_description: description05,
                                            pic_created_date: "2020-01-22",
                                             artgenre_ids: [1,5])}