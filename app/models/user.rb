# frozen_string_literal: true

class User < ApplicationRecord
  # Search

  searchkick

  # Badges

  has_merit

  # FriendlyId

  extend FriendlyId

  friendly_id :full_name, use: :slugged

  # Active Storage

  has_one_attached :avatar

  # Vote

  acts_as_voter

  # Devise modules

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  # Associations

  belongs_to :group

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
end
