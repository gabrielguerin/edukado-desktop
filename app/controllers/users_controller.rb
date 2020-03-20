# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'scaffold'

  before_action :set_user, only: [:posts]

  def posts
    @posts = @user.posts.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.js

      format.html
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.friendly.find(params[:id])
  end
end
