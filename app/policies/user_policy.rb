class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    record == user
  end

  def edit?
    record == user
  end

  def update?
    record == user
  end
end
