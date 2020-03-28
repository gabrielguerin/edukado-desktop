# frozen_string_literal: true



Rails.application.routes.draw do

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



  root 'statics#show', page: 'index'



  resources :faqs, only: %i[index], path: 'faq'



  resources :blogs, only: %i[show index], path: 'blog'



  resources :tags, only: %i[show]



  resources :badges, only: %i[index show user] do

    member do

      get :user

    end

  end



  devise_for :users, path: 'users', controllers: {



    registrations: 'users/registrations',



    invitations: 'users/invitations',



    confirmations: 'users/confirmations',



    sessions: 'users/sessions'



  }



  resources :users, only: %i[posts] do

    member do

      get :posts

    end

  end



  resources :posts do

    resources :comments do

      member do

        get 'like'



        get 'dislike'

      end

    end



    member do

      get 'like'



      get 'dislike'

    end

  end

end

