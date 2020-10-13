# frozen_string_literal: true

module ApplicationHelper
  # Application name

  def app_name
    'Edukado'
  end

  # Set default user avatar if user has no avatar

  def user_avatar(user)
    if user.avatar.attached?

      user.avatar

    else

      image_url('fallback/default.png')

    end
  end

  # Check if current user is the object owner

  def owner?(object)
    current_user == object.user
  end

  # Check if current user is group's supervisor

  def supervisor?(object)
    current_user.supervisor_role? && object.group == current_user.group
  end

  # Render flash messages with AJAX

  def ajax_flash(div_id)
    response = ''

    flash_div = ''

    flash.each do |name, message|
      next unless message.is_a?(String)

      flash_div = "<div class=\"alert alert-#{name == :notice ? 'success' : 'error'} ajax_flash\"><a class=\"close\" data-dismiss=\"alert\">&#215;</a> <div id=\"flash_#{name == :notice ? 'notice' : 'error'}\">#{h(message)}</div> </div>"
    end

    response = "$('.alert').remove();$('#{div_id}').prepend('#{flash_div}');"

    response.html_safe
  end
end
