Rails.application.routes.draw do
  root to: 'pages#home'

  resources :fighters, only: [:index, :new] do
  end
end
