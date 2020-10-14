# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
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
       (@user&.supervisor_role == true && @record&.group == @user&.group) ||
       (@user == @record)
      true
    end
  end
end
