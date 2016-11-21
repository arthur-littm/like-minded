# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = Category.create(name: "Food")
b = Category.create(name: "Nightlife")
c = Category.create(name: "Activity")

Question.create(category: a, content: "Best restaurant ?")
Question.create(category: a, content: "Gluten free restaurant ?")
Question.create(category: a, content: "Best sushi restaurant ?")
Question.create(category: b, content: "Best club ?")
Question.create(category: b, content: "Best bar ?")
Question.create(category: b, content: "Best late night food ?")
Question.create(category: c, content: "Best tourist attraction ?")
Question.create(category: c, content: "Best view ?")
Question.create(category: c, content: "Best city escape ?")
