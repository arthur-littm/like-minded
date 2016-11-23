class AnswerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view an answer
  end

  def create?
    true # Anyone can create an answer
  end

  def new?
    create?
  end

end

