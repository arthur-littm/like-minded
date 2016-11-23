class SurveyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user  # Anyone can view a survey
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

  def answering?
    true #going to be survey_friends .each ... or something like this
  end

end
