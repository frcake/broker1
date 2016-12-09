Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  
  devise_for :users, :controllers => { registrations: 'registrations' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #map.resources :users, :has_many => :classifieds
  get '/' => 'classifieds#index'
  resources :services
  resources :classifieds do
    put :favorite , on: :member
    put :sold , on: :member
    put :flag , on: :member
    get :autocomplete_make_name, :on => :collection
    resources :messages do
    end
  end
  root :to => 'classifieds#index'

  #get 'show/:id' => 'classifieds#show' , as: :classified


  #get 'signup' => 'users#new' , as: :signup #DEVISE
  #resources :users #DEVISE

  #post 'signup' => 'users#create' #DEVISE


  #resource :user, only: [:edit] do
  # collection do
  #    patch 'update_password'
  #  end
  #end

  get 'tags/:tag', to: 'services#index' , as: :tag

  get '/profile/:id' => 'users#show' , as: :profile

  #get '/edit/:id' => 'users#edit' , as: :edit

  #post 'update' => 'users#update' , as: :update


  #get '/login' => 'sessions#new' , as: :login #DEVISE

  #post '/login' => 'sessions#create' #DEVISE

  #delete '/logout' => 'sessions#destroy' #DEVISE


  resources :passwords
  resources :messages , only: [:new,:create]

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
    member do
      post :restore
    end
    collection do
      delete :empty_trash
    end
    member do
      post :mark_as_read
    end
  end

  resources :application , only: [:index]

  get '/newlisting' => 'classifieds#new' , as: :newlisting

  post '/newlisting' => 'classifieds#create'

  get '/editlisting/:id' => 'classifieds#edit' , as: :editlisting

  # post 'update' => 'classifieds#update'




  get '/listing/:id' => 'users#list' , as: :listinglist #list inside profile navtab


  get 'back' => 'application#back' , as: :back


  resources :categories do
    resources :classifieds do
    end
  end

  resources :photos

  #photo stuff

  #get 'photo/new' => 'photos#new'
  #get 'photoindex' => 'photos#index' ,as: :photoindex


end
