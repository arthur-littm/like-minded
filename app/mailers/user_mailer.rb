class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.answer.subject
  #
  def answer(survey)
    @survey = survey

    @survey.friends.each do |friend|
      @friend = friend
      mail(to: friend.email, subject: 'Your friend needs your advice!')
    end
  end
end
