Rails.application.routes.draw do
  
  # ここ↓
  # devise_for :users
  
  
  # get 'home/index'
  # get 'home/show' => 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  
  resources :users
  
  # get "users/sign_up" => "users/registrations#new"
  
  # ここ↓
  devise_scope :user do
    # get "sign_in", :to => "users/sessions#new"
    # get "sign_out", :to =>"users/sessions#new"
    get 'profile_edit', to: 'users/#_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/#update', as: 'profile_update'
    
  end
  
  # get "users/sign_up" => "users/registrations#new"
  # post "users/index" => "users#index"
  # get "users/index" => "users#index"
  get "users/:id/edit" => "users/registrations#edit"
  # get "home/index" => "home#index"
end
