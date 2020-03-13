Rails.application.routes.draw do

# --------------- user ---------------
# devise
  devise_for :users, :controllers => {
     :registrations => 'users/registrations',
     :sessions => 'users/sessions',
     :passwords => 'users/passwords'
    }

  root  'homes#top'
  get 'homes/about'

  resources :pets, only: [:index, :new, :show, :create, :destroy]do
    resources :records, only: [:edit, :update]do
    resources :hospitals, only: [:index]
    get 'search/search'
    end
  end
  resources :hospitals, only: [:index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
