Rails.application.routes.draw do
#  get '/artgenres', to:'artgenres#index'

  get '/artgenres/add' # ジャンル追加ページ
  post '/artgenres/add' # ジャンル追加提出

#  get '/artgenres/:id', to: 'artgenres#edit'
#  patch '/artgenres/:id', to: 'artgenres#edit'

  get 'users/new'
  root 'static_pages#home' # ホーム
  get '/help', to:'static_pages#help' #ヘルプページ
  get '/about', to:'static_pages#about' #サイト紹介ページ
  get '/contact', to:'static_pages#contact' #連絡先ページ
  get '/signup', to:'users#new' #サインアップページ
  post '/signup', to:'users#create' #サインアップ提出
  get '/login', to:'sessions#new' #
  post '/login', to:'sessions#create' #
  delete '/logout', to:'sessions#destroy' #ログアウト
  resources :users
  resources :pictures, only:[:new, :create, :edit, :update, :destroy] #投稿アート作品
  resources :artgenres, only:[:index, :edit, :create, :show, :update] #アートジャンル
end
