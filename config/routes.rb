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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
