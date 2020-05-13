# frozen_string_literal: true

class UsersController < ApplicationController
  # Layout

  layout :determine_layout

  # Find user

  before_action :set_user, only: %i[show posts]

  # GET /users/1

  def show
    unless current_user == @user

      redirect_back fallback_location: root_path,

                    notice: "Vous ne pouvez pas modifier le profil d'un autre utilisateur."

    end
  end

  # Display user's posts

  def posts
    @posts = @user.posts.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.js

      format.html
    end
  end

  private

  # Set user

  def set_user
    @user = User.friendly.find(params[:id])
  end

  # Determine layout based on action

  def determine_layout
    case action_name

    when 'posts'

      'scaffold'

    when 'show'

      '_app_nav'

    end
  end
end
