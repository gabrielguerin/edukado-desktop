# frozen_string_literal: true

class StaticsController < ApplicationController
  layout '_base'

  before_action :check_signed_in

  def index; end

  def show
    if valid_page?

      render template: "statics/#{params[:page]}"

    else

      render template: 'statics/errors/404', status: :not_found

    end
  end

  # Redirects users to the web application if they are already signed in

  def check_signed_in
    redirect_to posts_path if signed_in?
  end

  private

  def valid_page?
    File.exist?(
      Pathname.new(
        Rails.root + "app/views/statics/#{params[:page]}.html.erb"
      )
    )
  end
end
