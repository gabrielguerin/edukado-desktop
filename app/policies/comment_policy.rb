# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def resolve_admin
      if @user.superadmin_role?
        scope.all
      else
        scope.joins(:post).where('posts.group_id = ?', @user.group.id)
      end
    end
  end

  def show?
    true
  end

  def create?
    superadmin_or_supervisor_or_owner?
  end

  def update?
    superadmin_or_supervisor_or_owner?
  end

  def destroy?
    superadmin_or_supervisor_or_owner?
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

  private

  def superadmin_or_supervisor_or_owner?
    if (@user&.superadmin_role == true) ||
       (@user&.supervisor_role == true && @record&.post&.group == @user&.group) ||
       (@user == @record.user)
      true
    end
  end
end
