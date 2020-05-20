# frozen_string_literal: true

class BadgesController < ApplicationController
  # Layout

  layout 'scaffold'

  # Find user

  before_action :set_user, only: %i[user]

  # Find badge

  before_action :set_badge, only: %i[show]

  # GET /badges

  def index
    @badges = Merit::Badge.all
  end

  # GET /badges/1

  def show; end

  # GET /badges/:user

  def user; end

  private

  # Set badge

  def set_badge
    @badge = Merit::Badge.find(params[:badge_id])

    @id = @badge.keys[params[:id].to_i]

    @badge = @badge.find(@id)
  end

  # Set user

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
