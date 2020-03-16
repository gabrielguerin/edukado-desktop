# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@edukado.co'
  layout 'mailer'
end
