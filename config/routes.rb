Rails.application.routes.draw do

  resources :posts do
    resources :medias
  end

  devise_for :users
  root to: 'pages#home'

end
