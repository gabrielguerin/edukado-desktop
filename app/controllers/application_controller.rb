# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Set default url for Devise Mailer based on environment
  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end
end
