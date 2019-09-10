Rails.application.routes.draw do
  
  get 'posts/index', to: 'posts#index'
  get 'tasks/top', to: 'tasks#top'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
  resources :users
  resources :tasks
end
