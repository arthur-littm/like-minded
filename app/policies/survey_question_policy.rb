class SurveyQuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user  #Only survey creator can view
  end

  def new?
    create?
  end

  def update?
    record.survey.user == user
  end

  # def destroy?
  #   record.user == user
  # end

end
