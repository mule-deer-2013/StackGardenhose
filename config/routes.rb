StackGardenhose::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :questions, only: [:index, :new, :create, :show] do
    resources :answers, only: [:new, :create]
  end

  root to: 'questions#index'

end
