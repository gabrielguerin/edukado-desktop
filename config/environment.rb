# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Sendgrid
ActionMailer::Base.smtp_settings = {
  domain: 'edukado.co',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY']
}
