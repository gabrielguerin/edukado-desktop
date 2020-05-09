# frozen_string_literal: true

class NotificationsController < ApplicationController
  layout 'scaffold'

  before_action :authenticate_user!, only: %i[index]

  before_action :set_notification, only: %i[link_through]

  def index
    @notifications = current_user.notifications
  end

  def link_through
    @notification.update read: true
    redirect_to post_path @notification.post
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
