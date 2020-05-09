# frozen_string_literal: true

class NotificationsController < ApplicationController
  layout 'scaffold'

  before_action :authenticate_user!, only: %i[index]

  before_action :set_notification, only: %i[link_through]

  respond_to :js, :html, :json

  def index
    @notifications = current_user.notifications.page(params[:page]).per(20)
  end

  def read_all
    current_user.notifications.where(read: false).update_all(read: true)
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
