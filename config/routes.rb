Rails.application.routes.draw do
  root to: 'pages#home'

  resources :fighters, only: [:index, :new, :create, :edit, :update, :destroy] do
  end

  resources :fights, only: [:index, :new, :create] do
  end
end
