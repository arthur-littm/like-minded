class SurveyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a survey
  end

  def create?
    true  # Anyone can create a survey
  end

  def update?
    record.user == user  # Only survey creator can update it
  end

  def destroy?
    record.user == user  # Only survey creator can update it
  end

end
