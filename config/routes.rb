
Rails.application.routes.draw do

  resources :posts , only: [:index, :show, :new, :create, :destroy] do
    resources :medias
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: 'pages#home'

end
