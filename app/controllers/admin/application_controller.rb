# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    # layout 'layouts/admin/_side_menu'
    # layout 'layouts/admin/_dashboard_top_nav'
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      redirect_to '/', alert: 'Not authorized.' unless current_user && access?
    end

    private

    def access?
      current_user.admin = true
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
