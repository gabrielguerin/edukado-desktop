# frozen_string_literal: true

class User < ApplicationRecord
  # Badges

  has_merit

  # FriendlyId

  extend FriendlyId

  friendly_id :full_name, use: :slugged

  # Active Storage

  has_one_attached :avatar

  # Vote

  acts_as_voter

  # Send welcome email

  after_commit :welcome_send

  # Devise modules

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Associations

  has_many :tags_users, dependent: :destroy

  has_many :tags, through: :tags_users

  has_many :posts

  has_many :comments

  has_many :blogs

  has_many :invitations, class_name: to_s, as: :invited_by

  has_many :notifications, dependent: :destroy

  # Validations

  validates :description, length: {

    maximum: 550,

    too_long: '%<count> caractères est le maximum autorisé'

  }, presence: false

  # Full name

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  # Send welcome email

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
