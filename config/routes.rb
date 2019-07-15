Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'events#index'
  resources :events do
    resources :comments
  end
  resources :participants, only: %i[create destroy]
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[show]
  resources :relationships, only: %i[create destroy]
  get 'tags/:tag', to: 'events#index', as: :tag

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
