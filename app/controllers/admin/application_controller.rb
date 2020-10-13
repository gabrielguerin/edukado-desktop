# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,

# making it the ideal place to put authentication logic or other

# before_actions.

# If you want to add pagination or other controller-level concerns,

# you're free to overwrite the RESTful controller actions.

module Admin
  class ApplicationController < Administrate::ApplicationController
    # Layout

    layout 'sidenav'

    # Find admin
    before_action :authenticate_admin

    # Authenticate admin user
    def authenticate_admin
      unless current_user&.superadmin_role? || current_user&.supervisor_role?
        redirect_to '/',
                    alert: "Vous n'êtes pas autorisé à accéder à cette page."
      end
    end

    # Override this value to specify the number of elements to display at a time

    # on index pages. Defaults to 20.

    # def records_per_page

    #   params[:per_page] || 20

    # end
  end
end
