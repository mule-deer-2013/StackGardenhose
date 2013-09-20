StackGardenhose::Application.routes.draw do


  resources :users, only: [:new, :create, :show]
  resources :questions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :answers, only: [:new, :create, :edit, :update]
  end


  resources :sessions, only: [:new, :create, :destroy]

  resources :votes, only: [:new, :create]


  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: 'questions#index'


end
