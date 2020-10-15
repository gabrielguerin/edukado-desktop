class YearPolicy < ApplicationPolicy
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
end
