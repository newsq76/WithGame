Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'edit_profile', to: 'users#edit'
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
