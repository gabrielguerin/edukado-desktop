# frozen_string_literal: true

class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?; end

  def show?
    true
  end

  def new?; end

  def edit?
    superadmin?
  end

  def create?
    superadmin?
  end

  def update?
    superadmin?
  end

  def destroy?
    superadmin?
  end

  private

  def superadmin?
    @user&.superadmin_role?
  end
end
