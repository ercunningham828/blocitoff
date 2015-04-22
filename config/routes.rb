Rails.application.routes.draw do
  namespace :api do
  get 'items/create'
  end

  namespace :api do
  get 'lists/create'
  end

  get 'lists/show'

  devise_for :users
  
  resources :users, only: [:update,:show]

  resources :lists do
    resources :items, only: [:create,:destroy]
  end

  get 'about' =>'welcome#about'

    
  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end
  
  root to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
     resources :users do
      resources :lists 
    end

    resources :lists, only: [] do
      resources :items, only: [:create,:destroy,:update]
    end

    resources :items, only: [:destroy]
  end

end
