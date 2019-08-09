Rails.application.routes.draw do
  # get 'sessions/new'
  resources :sessions
  resources :users, only: %i[new create]

  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score', as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
