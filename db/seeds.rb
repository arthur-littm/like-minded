# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SurveyQuestion.destroy_all
Question.destroy_all
Category.destroy_all

a = Category.create(name: "Food", icon_name: "food.png")
b = Category.create(name: "Nightlife", icon_name: "nightlife.png")
c = Category.create(name: "Activity", icon_name: "activity.png")
d = Category.create(name: "Accomodation", icon_name: "accomodation.png")


Question.create(category: a, content: "Best restaurant ?")
Question.create(category: a, content: "Gluten free restaurant ?")
Question.create(category: a, content: "Best sushi restaurant ?")
Question.create(category: b, content: "Best club ?")
Question.create(category: b, content: "Best bar ?")
Question.create(category: b, content: "Best late night food ?")
Question.create(category: c, content: "Best tourist attraction ?")
Question.create(category: c, content: "Best view ?")
Question.create(category: c, content: "Best city escape ?")
Question.create(category: d, content: "Best hostel ?")
Question.create(category: d, content: "Best luxurious hotel ?")
Question.create(category: d, content: "Best neighbourhood to stay in ?")


question1 = Question.create(category: a, content: "Best restaurant in town?")
question2 = Question.create(category: d, content: "Best hotel in town ?")
arthur = User.create(email: "arthur@litt.com", encrypted_password: "123456", first_name: "arthur" )
responder = User.create(email: "responder@test.com", encrypted_password: "123456", first_name: "responder" )
s = Survey.create(city: "Paris", user: arthur)

SurveyQuestion.create(survey: s, question: question1)
SurveyQuestion.create(survey: s, question: question2)

ans11 = Answer.create()
ans12 = Answer.create()
ans21 = Answer.create()
ans22 = Answer.create()
