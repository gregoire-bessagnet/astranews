
Rails.application.routes.draw do

  root to: 'pages#home'


  resources :posts do

    resources :medias
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' , omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :index]

end

