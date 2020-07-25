Rails.application.routes.draw do
#  get '/artgenres', to:'artgenres#index'

  get '/artgenres/add'
  post '/artgenres/add'

#  get '/artgenres/:id', to: 'artgenres#edit'
#  patch '/artgenres/:id', to: 'artgenres#edit'

  get 'users/new'
  root 'static_pages#home' # ページのホーム
  get '/help', to:'static_pages#help' #ヘルプページ
  get '/about', to:'static_pages#about' #サイト紹介ページ
  get '/contact', to:'static_pages#contact' #連絡先ページ
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :pictures, only:[:new, :create, :edit, :update, :destroy]
  resources :artgenres, only:[:index, :edit, :create, :show, :update]
end
