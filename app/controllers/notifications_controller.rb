# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[link_through]

  def link_through
    @notification.update read: true
    redirect_to post_path @notification.post
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
