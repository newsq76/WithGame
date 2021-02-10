Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'edit_profile', to: 'users#edit'
 
 get 'signup', to: 'users#new'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 post 'groupposts/create' => 'groupposts#create', as: :grouppost_create
 
 resources :users, only: [:index, :show, :new, :create, :edit, :update] do
   member do
    get :favoritegroups
   end
 end
 
 resources :groups, only: [:index, :show, :new, :create, :destroy]
 resources :groupposts, only: [:new, :create, :destroy]
 resources :group_users, only: [:create, :destroy]
end
