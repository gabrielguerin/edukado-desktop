# frozen_string_literal: true

class NotificationsController < ApplicationController
  # Layout

  layout 'scaffold'

  # Only signed-in users can receive notifications

  before_action :authenticate_user!, only: %i[index]

  # Find notification

  before_action :set_notification, only: %i[link_through]

  # Respond to different formats

  respond_to :js, :html, :json

  # GET /notifications

  def index
    @notifications = current_user.notifications.page(params[:page]).per(20)
  end

  # Mark all notifications as read

  def read_all
    current_user.notifications.where(read: false).update_all(read: true)
  end

  def link_through
    @notification.update read: true

    redirect_to post_path @notification.post
  end

  private

  # Set notification

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
