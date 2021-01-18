Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'edit_profile', to: 'users#edit'
 
 get 'signup', to: 'users#new'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
