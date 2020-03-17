# frozen_string_literal: true

module ApplicationHelper
  def app_name
    Rails.application.class.module_parent_name
  end

  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      image_url('fallback/default')
    end
  end
end
