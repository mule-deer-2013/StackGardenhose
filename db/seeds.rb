# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
jim = User.create(name: "Jim", email: "jim@jim.com")
bob = User.create(name: "Bob", email: "bob@bob.com")
question1 = Question.create(title: "Good bars?", body: "Where can I get a good drink in this town?", user_id: jim.id)
answer1 = Answer.create(body: "Try Elixir on 17th Street.", user_id: bob.id, question_id: question1.id)
