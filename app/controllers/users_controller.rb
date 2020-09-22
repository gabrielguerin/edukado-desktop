# frozen_string_literal: true

class UsersController < ApplicationController
  # Layout

  layout :determine_layout

  # Find user

  before_action :set_user, only: %i[show posts dashboard]

  # GET /users/1

  def show
    return if current_user == @user
    @error_message = 'Vous ne pouvez pas modifier le profil d\'un autre utilisateur.'
    redirect_back fallback_location: group_path(current_user.group)
  end

  # Display user's posts

  def posts
    @posts = @user.posts.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.js

      format.html
    end
  end

  # User dashboard

  def dashboard
    return if current_user == @user
    @error_message = 'Vous ne pouvez pas accéder au dashboard d\'un autre utilisateur'
    redirect_back fallback_location: group_path(current_user.group)
  end

  private

  # Set user

  def set_user
    @user = User.friendly.find(params[:id])
  end

  # Set layout based on action

  def determine_layout
    case action_name

    when 'posts'

      'scaffold'

    when 'show'

      '_app_nav'

    when 'dashboard'

      'scaffold'

    end
  end
end
