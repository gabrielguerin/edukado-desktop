# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def resolve_admin
      @user.superadmin_role? ? scope.all : scope.where(group_id: @user.group.id)
    end
  end

  def index?
    true
  end

  def posts?
    true
  end

  def dashboard?
    superadmin_or_supervisor_or_owner?
  end

  def show?
    superadmin_or_supervisor_or_owner?
  end
end
