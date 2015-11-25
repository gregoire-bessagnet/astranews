
Rails.application.routes.draw do

  resources :posts , only: [:index, :show, :new, :create, :destroy] do
    resources :medias
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, only: :show
  root to: 'pages#home'

end
