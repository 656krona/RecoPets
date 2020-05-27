Rails.application.routes.draw do

  get 'users/show'
# --------------- user ---------------
# devise
  devise_for :users, controllers: {
    registrations:  'users/registrations',
    sessions:       'users/sessions',
    passwords:      'users/passwords'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  root  'homes#top'
  get 'homes/about'

  resources :pets do
    resources :records, only: [:edit, :update]do
      member do
      get :select
      get 'search/search'
      end
    end
  end

  resources :topics, only: [:index, :new, :create]do
    resources :comments, only: [:index, :create, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
  end

  resources :items, only: [:index, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]

  namespace :admins do
    root  'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
