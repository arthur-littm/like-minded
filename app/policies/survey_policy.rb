class SurveyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user  # Only survey creator can view a survey
  end

  def create?
    true  # Anyone can create a survey
  end

  def update?
    record.user == user  # Only survey creator can update it
  end

  def update_friends?
    record.user == user # Only survey creator can update it
  end

  def update_status?
    record.user == user # Only survey creator can update it
  end

  def destroy?
    record.user == user  # Only survey creator can update it
  end

  def answering?
    true #going to be survey_friends .each ... or something like this
  end

  def preview?
    true
  end

  def answer_update?
    true
  end

  def update_cover_picture?
    record.user == user  # Only survey creator can update it
  end

  def reverse_status?
    record.user == user
  end

end
