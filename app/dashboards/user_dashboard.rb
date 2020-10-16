# frozen_string_literal: true

require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES

  # a hash that describes the type of each of the model's fields.

  # Each different type represents an Administrate::Field object,

  # which determines how the attribute is displayed

  # on pages throughout the dashboard.

  ATTRIBUTE_TYPES = {

    sash: Field::BelongsTo.with_options(class_name: 'Merit::Sash'),

    votes: Field::HasMany.with_options(class_name: 'ActsAsVotable::Vote'),

    invited_by: Field::Polymorphic,

    tags_users: Field::HasMany,

    tags: Field::HasMany,

    posts: Field::HasMany,

    comments: Field::HasMany,

    blogs: Field::HasMany,

    invitations: Field::HasMany.with_options(class_name: 'User'),

    id: Field::Number,

    avatar: Field::ActiveStorage,

    email: Field::String,

    encrypted_password: Field::String,

    reset_password_token: Field::String,

    reset_password_sent_at: Field::DateTime,

    remember_created_at: Field::DateTime,

    created_at: Field::DateTime,

    updated_at: Field::DateTime,

    first_name: Field::String,

    last_name: Field::String,

    gender: Field::String,

    description: Field::Text,

    group: Field::BelongsTo,

    invitation_token: Field::String,

    invitation_created_at: Field::DateTime,

    invitation_sent_at: Field::DateTime,

    invitation_accepted_at: Field::DateTime,

    invitation_limit: Field::Number,

    invitations_count: Field::Number,

    sash_id: Field::Number,

    level: Field::Number,

    slug: Field::String

  }.freeze

  # COLLECTION_ATTRIBUTES

  # an array of attributes that will be displayed on the model's index page.

  # By default, it's limited to four items to reduce clutter on index pages.

  # Feel free to add, remove, or rearrange items.

  COLLECTION_ATTRIBUTES = %i[

    id

    first_name

    last_name

    email

    group

  ].freeze

  # SHOW_PAGE_ATTRIBUTES

  # an array of attributes that will be displayed on the model's show page.

  SHOW_PAGE_ATTRIBUTES = %i[

    id

    avatar

    first_name

    last_name

    slug

    email

    group

    gender

    description

    tags

    posts

    comments

    created_at

    updated_at

  ].freeze

  # FORM_ATTRIBUTES

  # an array of attributes that will be displayed

  # on the model's form (`new` and `edit`) pages.

  FORM_ATTRIBUTES = %i[

    first_name

    last_name

    slug

    gender

    description

    email

    encrypted_password

    admin

  ].freeze

  # COLLECTION_FILTERS

  # a hash that defines filters that can be used while searching via the search

  # field of the dashboard.

  # For example to add an option to search for open resources by typing "open:"

  # in the search field:

  #   COLLECTION_FILTERS = {

  #     open: ->(resources) { where(open: true) }

  #   }.freeze

  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed

  # across all pages of the admin dashboard.

  def display_resource(user)
    "#{user.first_name} #{user.last_name}"
  end
end
