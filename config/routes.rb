StackGardenhose::Application.routes.draw do


  resources :users, only: [:new, :create, :show]
  resources :questions, only: [:index, :new, :create, :show] do
    resources :answers, only: [:new, :create]
  end


  resources :sessions, only: [:new, :create, :destroy]

  resources :votes, only: [:create]


  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: 'questions#index'


end
