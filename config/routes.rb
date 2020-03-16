Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :blogs
      resources :comments
      resources :faqs
      resources :posts
      resources :statics
      resources :tags

      root to: "users#index"
    end
  resources :faqs
  resources :blogs
  resources :statics
  resources :tags
  resources :comments
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
