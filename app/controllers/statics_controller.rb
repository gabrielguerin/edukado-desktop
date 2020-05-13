# frozen_string_literal: true

class StaticsController < ApplicationController
  # Layout

  layout 'statics'

  # Check if user is signed in

  before_action :check_signed_in

  # GET /:page

  def show
    if valid_page?

      render template: params[:page].to_s

    else

      render page: '/public/404', status: :not_found

    end
  end

  private

  # Check if file exists in views/statics

  def valid_page?
    File.exist?(
      Pathname.new(
        Rails.root + "app/views/statics/#{params[:page]}.html.erb"
      )
    )
  end

  # Redirect to posts#index if user is already signed in

  def check_signed_in
    redirect_to posts_path if signed_in?
  end
end
