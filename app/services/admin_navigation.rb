# frozen_string_literal: true

class AdminNavigation
  # Set pages to remove from Admin Dashboard's sidebar

  HIDDEN_PAGES = %w[

    blogs_tags

    posts_tags

    tags_users

    faqs

    statics

    acts_as_votable/votes

    merit/badges_sashes

    merit/sashes

    merit/scores

    merit/activity_logs

    merit/score/points

    pg_search/documents

  ].freeze

  def self.routes(admin)
    admin.resources.reject { |i| i.resource.in?(HIDDEN_PAGES) }
  end
end
