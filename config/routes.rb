Rails.application.routes.draw do

  get 'favs/create'

  get 'favs/destroy'

  root to: 'pages#home'


  resources :posts do
    resources :favs, only: [:create, :destroy]
    resources :uploads
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' , omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :index]

end

