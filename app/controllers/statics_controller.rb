# frozen_string_literal: true

class StaticsController < ApplicationController
  before_action :check_signed_in

  layout '_base'

  # Redirects users to the web application if they are already signed in

  def check_signed_in
    redirect_to posts_path if signed_in?
  end

  def index; end

  def show
    if valid_page?

      render template: "statics/#{params[:page]}"

    else

      render template: 'statics/errors/404', status: :not_found

    end
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
