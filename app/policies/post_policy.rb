# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def resolve_admin
      @user.superadmin_role? ? scope.all : scope.where({ group_id: @user.group.id })
    end
  end

  def index?; end

  def show?
    true
  end

  def create?; end

  def edit?
    superadmin_or_supervisor_or_owner?(@record.user, @record.user.group)
  end

  def update?
    superadmin_or_supervisor_or_owner?(@record.user, @record.user.group)
  end

  def destroy?
    superadmin_or_supervisor_or_owner?(@record.user, @record.user.group)
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
