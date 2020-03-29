# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[user]
  before_action :set_badge, only: %i[show]
  layout 'scaffold'

  # GET /badges

  def index
    @badges = Merit::Badge.all
  end

  def show; end

  def user; end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_badge
    @badge = Merit::Badge.find(params[:badge_id])
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
