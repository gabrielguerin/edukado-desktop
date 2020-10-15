# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  def superadmin_or_supervisor_or_owner?(record = @record)
    return true if superadmin? ||
                   (@user&.supervisor_role? && record == @user&.group) ||
                   (@user == @record.user)
  end

  def superadmin?
    @user&.superadmin_role?
  end
end
