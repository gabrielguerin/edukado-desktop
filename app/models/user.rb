# frozen_string_literal: true

class User < ApplicationRecord
  has_merit

  extend FriendlyId

  friendly_id :full_name, use: :slugged

  has_one_attached :avatar

  acts_as_voter

  after_commit :welcome_send

  # Include default devise modules. Others available are:

  # :lockable, :timeoutable, :trackable and :omniauthable

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :tags_users, dependent: :destroy

  has_many :tags, through: :tags_users

  has_many :posts

  has_many :comments

  has_many :blogs

  has_many :invitations, class_name: to_s, as: :invited_by

  has_many :notifications, dependent: :destroy

  validates :description, length: {

    maximum: 550,

    too_long: '%<count> caractères est le maximum autorisé'

  }, presence: false

  def full_name
    "#{first_name} #{last_name}"
  end

  def likes_sum
    @user.votes.up.size
  end

  def dislikes_sum
    @user.votes.down.size
  end

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
