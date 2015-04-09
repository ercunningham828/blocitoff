Rails.application.routes.draw do
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

end
