Rails.application.routes.draw do

  resources :posts , only: [:index, :show, :new, :create, :destroy] do
    resources :medias
  end
  devise_for :users
  root to: 'pages#home'

end
