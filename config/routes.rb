FatFreeCRM::Application.routes.draw do

  root :to => 'home#index'

  devise_for :users, :controllers => { :sessions => 'users/sessions' } do
    match 'profile', :to => "users#show", :as => :profile
     resources :users do
      member do
        get :avatar
        get :password
        put :upload_avatar
        put :change_password
      end
    end

    # get :avatar, :to => "users/avatar"
    # get :password, :to => "users/password"
    # put :upload_avatar, :to => "users/upload_avatar"
    # put :change_password, :to => "users/change_password"
  end

  match 'activities' => 'home#index'
  match 'admin'      => 'admin/users#index',       :as => :admin
  match 'options'    => 'home#options'
  match 'profile'    => 'users#show',              :as => :profile
  match 'timeline'   => 'home#timeline',           :as => :timeline
  match 'timezone'   => 'home#timezone',           :as => :timezone
  match 'toggle'     => 'home#toggle'



#  resource  :authentication
  resources :comments
  resources :emails
  resources :passwords

  resources :accounts do
    collection do
      get  :options
      get  :search
      post :auto_complete
      post :redraw
    end
    member do
      put :attach
      post :discard
    end
  end

  resources :campaigns do
    collection do
      get  :filter
      get  :options
      get  :search
      post :auto_complete
      post :redraw
    end
    member do
      put  :attach
      post :discard
    end
  end

  resources :contacts do
    collection do
      get  :options
      get  :search
      post :auto_complete
      post :redraw
    end
    member do
      put  :attach
      post :discard
    end
  end

  resources :leads do
    collection do
      get  :filter
      get  :options
      get  :search
      post :auto_complete
      post :redraw
    end
    member do
      get  :convert
      post :discard
      put  :attach
      put  :promote
      put  :reject
    end
  end

  resources :opportunities do
    collection do
      get  :filter
      get  :options
      get  :search
      post :auto_complete
      post :redraw
    end
    member do
      put  :attach
      post :discard
    end
  end

  resources :tasks do
    collection do
      get  :filter
      post :auto_complete
    end
    member do
      put :complete
    end
  end

=begin
  resources :users do
    member do
      get :avatar
      get :password
      put :upload_avatar
      put :change_password
    end
  end
=end

  namespace :admin do
    resources :users do
      collection do
        get  :search
        post :auto_complete
      end
      member do
        get :confirm
        put :suspend
        put :reactivate
      end
    end

    resources :settings
    resources :plugins
  end

#  match '/:controller(/:action(/:id))'
end

