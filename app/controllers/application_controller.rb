# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def authenticate_user!
    if user_signed_in?

      redirect_to posts_path

      super

    else

      redirect_to new_user_session_path, notice: 'Vous devez vous connecter pour accéder à cette page'

    end
  end
end
