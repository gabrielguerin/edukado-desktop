# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Authorization system

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Set default url for Devise Mailer based on environment

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  private

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisés à accéder à cette page"

    redirect_to request.referrer || root_path
  end
end
