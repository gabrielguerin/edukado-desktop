# frozen_string_literal: true

class Post < ApplicationRecord
  include PgSearch::Model

  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :posts_tags, dependent: :destroy

  has_many :tags, through: :posts_tags

  has_one_attached :file

  acts_as_votable

  validates :title, presence: true, length: {

    in: 2..80,

    too_short: '%<count> caractères est le minimum autorisé',

    too_long: '%<count> caractères est le maximum autorisé'

  }

  validates :description, presence: true, length: {

    minimum: 2, too_short: '%<count> caractères est le minimum autorisé'

  }

  pg_search_scope :search,
                  against: %i[title description],

                  associated_against: {

                    tags: %i[title],

                    user: %i[first_name last_name description]

                  }

  def likes_sum
    get_likes.size
  end

  def dislikes_sum
    get_dislikes.size
  end

  def self.perform_search(keyword)
    if keyword.present?

      then Post.search(keyword)

    else Post.order(created_at: :desc).paginate(
      page: params[:page]
    )

    end
  end

  def select_most_recent_comments(number)
    ordered_comments = comments.order(updated_at: :desc)

    number == 'all' ? ordered_comments : ordered_comments.take(number)
  end

  def tag_list=(titles)
    self.tags = titles.split(',').map do |title|
      Tag.where(title: title.strip).first_or_create!
    end
  end

  def tag_list
    tags.map(&:title).join(', ')
  end
end
