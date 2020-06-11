Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :recipes, only: :index
  resources :cookbooks
  resources :dispenses do
    resources :dispense_inclusions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
