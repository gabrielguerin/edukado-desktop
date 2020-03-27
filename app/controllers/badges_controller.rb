# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!

  layout 'scaffold'

  # GET /badges

  def index
    @badges = Merit::Badge.all
  end
end
