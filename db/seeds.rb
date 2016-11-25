# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Answer.destroy_all
SurveyQuestion.destroy_all
Question.destroy_all
Category.destroy_all

a = Category.create(name: "Food", icon_name: "fa fa-cutlery")
b = Category.create(name: "Nightlife", icon_name: "fa fa-glass")
c = Category.create(name: "Activity", icon_name: "fa fa-bicycle")
d = Category.create(name: "Accomodation", icon_name: "fa fa-bed")


Question.create(category: a, content: "Where can I drink and eat at the same time?")
Question.create(category: a, content: "Best pizza in town ?")
Question.create(category: a, content: "Where to have brunch ?")
Question.create(category: a, content: "All time favorite restaurant?")
Question.create(category: a, content: "What should I avoid eating ?")
Question.create(category: a, content: "Most unusual restaurant ?")
Question.create(category: a, content: "Best sushi in town ?")
Question.create(category: a, content: "Best indian restaurant ?")
Question.create(category: a, content: "Where to have late night fast food ?")
Question.create(category: a, content: "Good non-crowded restaurants")

Question.create(category: b, content: "Where should I go out ?")
Question.create(category: b, content: "Any bar suggestions ?")
Question.create(category: b, content: "Best happy hour in town ?")
Question.create(category: b, content: "Where do I get drunk ?")
Question.create(category: b, content: "Where do I meet people ?")
Question.create(category: b, content: "Best techno clubs ?")
Question.create(category: b, content: "Great night under £30")
Question.create(category: b, content: "Club door policy advice ?")
Question.create(category: b, content: "Area to avoid at night ?")
Question.create(category: b, content: "How to get around after public transportation stops ?")

Question.create(category: c, content: "Best tourist attraction ?")
Question.create(category: c, content: "Most breathtaking view ?")
Question.create(category: c, content: "Local gems that aren't full of tourists ?")
Question.create(category: c, content: "What to do on a rainy day ?")
Question.create(category: c, content: "What to do on a snowy day ?")
Question.create(category: c, content: "Best christmas activities")
Question.create(category: c, content: "Family activities ?")
Question.create(category: c, content: "Fun stuff to do with friends ?")
Question.create(category: c, content: "Where to go for a nature escape ?")
Question.create(category: c, content: "Sporty activites that are fun to do ?")

Question.create(category: d, content: "Best hostel ?")
Question.create(category: d, content: "Best luxurious hotel ?")
Question.create(category: d, content: "Best neighbourhood to stay in ?")
Question.create(category: d, content: "Any advice for long stay accomodation ?")
Question.create(category: d, content: "Best area to stay in for a week end ?")
Question.create(category: d, content: "Affordable hotel ?")
Question.create(category: d, content: "Airbnb suggestions ?")
Question.create(category: d, content: "Best place to stay in the middle of nature ?")
Question.create(category: d, content: "Area to stay in without a vehicle")
Question.create(category: d, content: "Family friendly neighbourhood")
