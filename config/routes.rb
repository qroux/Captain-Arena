Rails.application.routes.draw do
  root to: 'pages#home'

  resources :fighters, only: [:index] do
  end
end
