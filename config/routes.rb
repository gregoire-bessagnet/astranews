Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :medias
  end

  root to: 'pages#home'

end
