Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #map.resources :users, :has_many => :classifieds
  get '/' => 'classifieds#index'

  #get 'show/:id' => 'classifieds#show' , as: :classified


  get 'signup' => 'users#new' , as: :signup
  resources :users

  post 'signup' => 'users#create'
  

  get '/edit/:id' => 'users#edit' , as: :edit

  post 'update' => 'users#update' , as: :update




  get '/login' => 'sessions#new' , as: :login
  
  post '/login' => 'sessions#create'
  
  delete '/logout' => 'sessions#destroy'


  
  get '/profile/:id' => 'users#show' , as: :profile


  get '/newlisting' => 'classifieds#new' , as: :newlisting

  resources :classifieds

  post '/newlisting' => 'classifieds#create'

  get '/editlisting/:id' => 'classifieds#edit' , as: :editlisting

 # post 'update' => 'classifieds#update'

  


  get '/listing/:id' => 'users#list' , as: :listinglist #list inside profile navtab


  get 'back' => 'application#back' , as: :back


  resources :categories
#photo stuff
  #resources :photos, only: [:new, :create, :index, :destroy]


#get 'photo/new' => 'photos#new'
#get 'photoindex' => 'photos#index' ,as: :photoindex


end

