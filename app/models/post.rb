# frozen_string_literal: true

class Post < ApplicationRecord
  # Search

  searchkick word_start: %i[title]

  # Active Storage

  has_one_attached :file

  # FriendlyId

  extend FriendlyId

  friendly_id :title, use: :slugged

  # Associations

  belongs_to :user

  belongs_to :group

  belongs_to :category

  has_many :comments, dependent: :destroy

  has_many :posts_tags, dependent: :destroy

  has_many :tags, through: :posts_tags

  has_many :notifications, dependent: :destroy

  # Vote

  acts_as_votable

  # Views

  is_impressionable

  # Validations

  validates :title, presence: true, length: {

    minimum: 2, too_short: '%<count> caractères est le minimum autorisé'

  }

  validates :description, presence: true, length: {

    minimum: 2, too_short: '%<count> caractères est le minimum autorisé'

  }

  # Limit tags per post

  validate :validate_tags

  # Search data

  def search_data
    {

      title: title,

      description: description,

      user_full_name: user.full_name,

      group_name: group.name,

      group_id: group.id

    }.merge(
      tag: tags.map(&:title),

      comments: comments.map(&:description)
    )
  end

  # Like count

  def likes_sum
    get_likes.size
  end

  # Dislike count

  def dislikes_sum
    get_dislikes.size
  end

  # Create tags

  def tag_list=(titles)
    self.tags = titles.split(',').map do |title|
      Tag.where(title: title.strip).first_or_create!
    end
  end

  # Join tags

  def tag_list
    tags.map(&:title).join(', ')
  end

  # Limit tags per post

  def validate_tags
    if tags.size > 5

      errors.add(
        :tags,
        'Vous ne pouvez ajouter que 5 tags par publication'
      )

    end
  end
end
