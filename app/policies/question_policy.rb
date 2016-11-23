class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a question
  end

  def create?
    true # Anyone can create a question
  end

  def update?
    record.user == user  # Only question creator can update it
  end

  def destroy?
    record.user == user  # Only question creator can update it
  end

end
