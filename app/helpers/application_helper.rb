# frozen_string_literal: true

module ApplicationHelper
  def app_name
    'Edukado'
  end

  def user_avatar(user)
    if user.avatar.attached?

      user.avatar

    else

      image_url('fallback/default.png')

    end
  end

  def owner?(object)
    current_user == object.user
  end

  def ajax_flash(div_id)
    response = ''
    flash_div = ''

    flash.each do |name, message|
      if message.is_a?(String)
        flash_div = "<div class=\"alert alert-#{name == :notice ? 'success' : 'error'} ajax_flash\"><a class=\"close\" data-dismiss=\"alert\">&#215;</a> <div id=\"flash_#{name == :notice ? 'notice' : 'error'}\">#{h(message)}</div> </div>"
      end
    end
    response = "$('.alert').remove();$('#{div_id}').prepend('#{flash_div}');"
    response.html_safe
  end
end
