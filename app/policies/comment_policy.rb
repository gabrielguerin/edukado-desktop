# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def resolve_admin
      @user.superadmin_role? ? scope.all : scope.joins(:post).where('posts.group_id = ?', @user.group.id)
    end
  end

  def show?
    true
  end

  def create?
    superadmin_or_supervisor_or_owner?(@record&.post&.group)
  end

  def update?
    superadmin_or_supervisor_or_owner?(@record&.post&.group)
  end

  def destroy?
    superadmin_or_supervisor_or_owner?(@record&.post&.group)
  end

  def like?
    true
  end

  def unlike?
    true
  end

  def dislike?
    true
  end

  def undislike?
    true
  end
end
