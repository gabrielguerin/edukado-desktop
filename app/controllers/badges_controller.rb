# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!
end
