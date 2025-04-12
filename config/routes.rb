Rails.application.routes.draw do
  devise_for :users
  root to:"homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create,:destroy]
    resources :favorite, only: [:create,:destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
 end
end
