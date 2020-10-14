# frozen_string_literal: true

class UsersController < ApplicationController
  # Layout

  layout :determine_layout

  # Find user

  before_action :set_user, only: %i[show posts dashboard]

  # GET /posts

  def index
    @search = params[:search].present? ? params[:search] : nil

    @users = if @search

               # Render search results

               User.search(params[:search], page: params[:page], per_page: 20)

             else

               # Render users

               User.all.order(first_name: :asc).page(params[:page])

             end
  end

  # GET /users/1

  def show; end

  # Display user's posts

  def posts
    @posts = @user.posts.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.js

      format.html
    end
  end

  # User dashboard

  def dashboard; end

  private

  # Set user

  def set_user
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  # Set layout based on action

  def determine_layout
    case action_name

    when 'posts'

      'scaffold'

    when 'show'

      'statics'

    when 'dashboard'

      'statics'

    when 'index'

      'scaffold'

    end
  end
end
