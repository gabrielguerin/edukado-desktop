# frozen_string_literal: true

Rails.application.routes.draw do
  resources :years
  # Admin routes

  namespace :admin do
    resources :users

    resources :posts

    resources :comments

    resources :tags

    resources :blogs, path: 'blog'

    resources :faqs, path: 'faq'

    resources :posts_tags

    resources :tags_users

    resources :blogs_tags

    namespace :merit do
      resources :activity_logs

      resources :badges_sashes

      resources :sashes

      resources :scores

      namespace :score do
        resources :points
      end
    end

    namespace :acts_as_votable do
      resources :votes
    end

    namespace :pg_search do
      resources :documents
    end

    root to: 'users#index'
  end

  # Subject routes

  resources :subjects, only: %i[show index]

  # Group routes

  resources :groups, only: %i[show index]

  # FAQ routes

  resources :faqs, only: %i[index], path: 'faq'

  # Blogs routes

  resources :blogs, only: %i[show index], path: 'blog'

  # Tags routes

  resources :tags, only: %i[show]

  # Badges routes

  resources :badges, only: %i[index show user] do
    member do
      get :user
    end
  end

  # Devise routes

  devise_for :users, path: 'users', controllers: {

    registrations: 'users/registrations',

    invitations: 'users/invitations',

    confirmations: 'users/confirmations',

    sessions: 'users/sessions'

  }

  # Download routes

  resources :downloads, only: :create

  # Users routes

  resources :users, only: %i[show posts] do
    member do
      get :posts
    end
  end

  # Categories routes

  resources :categories, only: %i[index show]

  # Posts routes

  resources :posts do
    member do
      get 'like'

      get 'unlike'

      get 'dislike'

      get 'undislike'
    end

    # Comments routes

    resources :comments do
      member do
        get 'like'

        get 'unlike'

        get 'dislike'

        get 'undislike'
      end
    end

    # Search routes

    collection do
      get :autocomplete
    end
  end

  # Notifications routes

  get 'notifications/:id/link_through',
      to: 'notifications#link_through',

      as: :link_through

  resources :notifications, only: %i[index] do
    post :read_all, on: :collection
  end

  # Statics routes

  root 'statics#show', page: 'home'

  get '/:page', to: 'statics#show'
end
