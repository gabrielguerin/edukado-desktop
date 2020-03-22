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

      # If it has 10 comments, grant commenter-10 badge

      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|

      #   comment.user.comments.count  == 10

      # end

      # If it has 5 votes, grant relevant-commenter badge

      # grant_on 'comments#vote', badge: 'relevant-commenter',

      #   to: :user do |comment|

      #   comment.votes.count == 5

      # end

      # Registration

      grant_on 'users/confirmations#show', badge: 'just-registered',

                                           model_name: 'User',

                                           to: :itself do
        User.count <= 100
      end

      # Contributor

      grant_on 'posts#create',
               badge: 'contributor',

               level: 1,

               to: :user do |post|
        post.user && post.user.posts.count == 1
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 2,

               to: :user do |post|
        post.user && post.user.posts.count == 3
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 3,

               to: :user do |post|
        post.user && post.user.posts.count == 5
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 4,

               to: :user do |post|
        post.user && post.user.posts.count == 10
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 5,

               to: :user do |post|
        post.user && post.user.posts.count == 15
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 6,

               to: :user do |post|
        post.user && post.user.posts.count == 25
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 7,

               to: :user do |post|
        post.user && post.user.posts.count == 50
      end

      grant_on 'posts#create',
               badge: 'contributor',

               level: 8,

               to: :user do |post|
        post.user && post.user.posts.count == 100
      end

      # Critic

      grant_on 'comments#create',
               badge: 'critic',

               level: 1,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 1
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 2,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 2
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 3,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 3
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 4,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 25
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 5,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 50
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 6,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 100
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 7,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 250
      end

      grant_on 'comments#create',
               badge: 'critic',

               level: 8,

               to: :user do |comment|
        comment.user && comment.user.comments.count == 500
      end

      # Liked

      grant_on 'posts#like',
               badge: 'liked',

               level: 1,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 1
      end

      grant_on 'posts#like',
               badge: 'liked',

               level: 2,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 3
      end

      grant_on 'posts#like',
               badge: 'liked',

               level: 3,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 5
      end

      grant_on 'posts#like',
               badge: 'liked',

               level: 4,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 10
      end

      # Loved

      grant_on 'posts#like',
               badge: 'loved',

               level: 1,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 15
      end

      grant_on 'posts#like',
               badge: 'loved',

               level: 2,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 25
      end

      grant_on 'posts#like',
               badge: 'loved',

               level: 3,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 50
      end

      grant_on 'posts#like',
               badge: 'loved',

               level: 4,

               to: :user do |post|
        post.user.posts.sum(&:likes_sum) == 100
      end

      # Invitations

      # grant_on 'users/invitations#create',
      #          badge: 'friendly',

      #          level: 1,

      #          model_name: 'User',

      #          to: :itself do |user|
      #   user.invitations_count == 1
      # end

      # grant_on 'users/invitations#create',
      #          badge: 'friendly',

      #          level: 2,

      #          model_name: 'User',

      #          to: :itself do |user|
      #   user.invitations_count == 3
      # end

      # Voted

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 1
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 5
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 10
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 25
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 50
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 100
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 250
      end

      grant_on ['posts#like', 'posts#dislike'],
               badge: 'judgemental',

               level: 1,

               model_name: 'User',

               to: :action_user do |user|
        user.likes_sum + user.dislikes_sum == 500
      end
    end
  end
end
