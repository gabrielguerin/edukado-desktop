# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'no-reply@edukado.co'

  layout 'mailer'

  def welcome_email(user)
    @user = user

    @url = 'www.edukado.co'
  end
end
