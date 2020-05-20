# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# +grant_on+ accepts:

# * Nothing (always grants)

# * A block which evaluates to boolean (receives the object as parameter)

# * A block with a hash composed of methods to run on the target object with

#   expected values (+votes: 5+ for instance).

# +grant_on+ can have a +:to+ method name, which called over the target object

# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,

# etc). If it's not defined merit will apply the badge to the user who

# triggered the action (:action_user by default). If it's :itself, it badges

# the created object (new user for instance).

# The :temporary option indicates that if the condition doesn't hold but the

# badge is granted, then it's removed. It's false by default (badges are kept

# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge

      # Should be "current_user" after registration for badge to be granted.

      # Find badge by badge_id, badge_id takes presidence over badge

      # Registration

      grant_on 'users/confirmations#show', badge_id: 1,

                                           model_name: 'User',

                                           to: :itself do
        User.count <= 100
      end

      # Contributor

      grant_on 'posts#create',
               badge_id: 2,

               level: 1,

               to: :user do |post|
        post.user && post.user.posts.count == 10
      end

      grant_on 'posts#create',
               badge_id: 3,

               level: 2,

               to: :user do |post|
        post.user && post.user.posts.count == 25
      end

      grant_on 'posts#create',
               badge_id: 4,

               level: 3,

               to: :user do |post|
        post.user && post.user.posts.count == 100
      end

      # Voter

      grant_on ['posts#like', 'posts#dislike'],
               badge_id: 5,

               level: 1,

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 10
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge_id: 6,

               level: 3,

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 100
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge_id: 7,

               level: 4,

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 500
      end

      # Representant

      grant_on 'posts#like',
               badge_id: 8,

               level: 1,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 10
      end

      grant_on 'posts#like',
               badge_id: 9,

               level: 2,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 25
      end

      grant_on 'posts#like',
               badge_id: 10,

               level: 3,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 100
      end

      # Critic

      grant_on 'posts#dislike',
               badge_id: 11,

               level: 1,

               to: :action_user do |user|
        user.dislikes_sum == 1
      end

      # Comments

      grant_on 'comments#create',
               badge_id: 12,

               level: 1,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 10
      end

      grant_on 'comments#create',
               badge_id: 13,

               level: 2,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 100
      end

      grant_on 'comments#create',
               badge_id: 14,

               level: 3,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 500
      end

      # Member

      grant_on 'users/sessions#create',
               badge_id: 46,

               level: 1,

               model_name: 'User',

               to: :itself do |user|
        (Date.today - user.created_at.to_date).to_i >= 365
      end

      grant_on 'users/sessions#create',
               badge_id: 47,

               level: 2,

               model_name: 'User',

               to: :itself do |user|
        (Date.today - user.created_at.to_date).to_i >= (365 * 3)
      end

      grant_on 'users/sessions#create',
               badge_id: 48,

               level: 3,

               model_name: 'User',

               to: :itself do |user|
        (Date.today - user.created_at.to_date).to_i >= (365 * 10)
      end

      # Invitations

      grant_on 'users/invitations#create',
               badge_id: 51,

               level: 1,

               model_name: 'User',

               to: :itself do |user|
        user.invitations_count == 10
      end

      grant_on 'users/invitations#create',
               badge_id: 52,

               level: 2,

               model_name: 'User',

               to: :itself do |user|
        user.invitations_count == 25
      end

      grant_on 'users/invitations#create',
               badge_id: 53,

               level: 3,

               model_name: 'User',

               to: :itself do |user|
        user.invitations_count == 100
      end
    end
  end
end
