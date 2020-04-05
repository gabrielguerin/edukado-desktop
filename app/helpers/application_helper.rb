# frozen_string_literal: true

module ApplicationHelper
  def app_name
    'Edukado'
  end

  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      image_url('fallback/default')
    end
  end

  def owner?(object)
    current_user == object.user
  end
end
