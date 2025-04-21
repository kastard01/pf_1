Rails.application.routes.draw do
  devise_for :users
  root to:"homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  
  resources :posts do
    resources :post_comments, only: [:create,:destroy]
    resources :favorites, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show, :edit, :update,] do
    
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  end
end
