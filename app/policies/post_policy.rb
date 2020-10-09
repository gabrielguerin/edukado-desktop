# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user_is_owner_of_record?
  end

  def create?
    user_is_owner_of_record?
  end

  def show?
    user_is_owner_of_record?
  end

  def update?
    user_is_owner_of_record? || @user.superadmin_role? || is_group_supervisor? === true
  end

  def destroy?
    user_is_owner_of_record? || @user.superadmin_role? || is_group_supervisor? === true
  end

  private

  def user_is_owner_of_record?
    @user == @record.user
  end

  def is_group_supervisor?
    if @user.supervisor_role? === true && @record.group === @user.group
      return true
    end
  end
end
