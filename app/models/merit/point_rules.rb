# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Points are a simple integer value which are given to "meritable" resources

# according to rules in +app/models/merit/point_rules.rb+. They are given on

# actions-triggered, either to the action user or to the method (or array of

# methods) defined in the +:to+ option.

# 'score' method may accept a block which evaluates to boolean

# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      # If user adds a post

      score 50,
            to: :action_user,

            on: 'posts#create' do |post|
        post.file.present?
      end

      score -50,
            to: :action_user,

            on: 'active_storage/blobs#show'
    end
  end
end
