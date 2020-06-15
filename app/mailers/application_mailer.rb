# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Edukado <no-reply@edukado.co>'

  layout 'mailer'
end
