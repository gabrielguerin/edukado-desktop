# frozen_string_literal: true

class StaticsController < ApplicationController
  layout :determine_layout

  before_action :check_signed_in, only: %i[index]

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

  def determine_layout
    current_user ? '_app_nav' : 'statics'
  end
end
