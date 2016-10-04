Rails.application.routes.draw do

  get 'favoris/update'

  get 'favoris/edit'

  get 'favoris/show'

  root to: 'pages#home'


  resources :posts do
    resources :favs, only: [:create]
    resources :uploads
  end
  resources :favs, only: [:index, :destroy]

  devise_for :users, :controllers => { registrations: 'users/registrations' , omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :index]

end

