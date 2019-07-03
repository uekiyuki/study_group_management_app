Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'events#index'
  resources :events do
    resources :comments
  end
  resources :participants, only: %i[create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
