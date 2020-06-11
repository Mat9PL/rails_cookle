Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :recipes, only: :index
  resources :cookbooks do
    resources :cookbook_inclusions
  end
  resources :dispenses do
    resources :dispense_inclusions
  end

  resources :cookbook_inclusions, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
