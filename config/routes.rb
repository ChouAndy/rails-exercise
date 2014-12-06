Rails.application.routes.draw do
  ## Post
  resources :posts

  ## Devise & User
  devise_for :user, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get ':id' => 'users#show', as: :user_profile
  get ':id/setting' => 'users#edit', as: :user_setting
  match ':id/setting' => 'users#update', via: [:put, :patch]

  ## Common
  get 'examples(/:action)', controller: 'examples', as: :examples
  root 'welcome#index'
end
