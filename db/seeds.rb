# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# adding changes from masha
#tags have a name
tags = ["Ruby", "JavaScript", "iOS", "HTML", "CSS", "Sass", "Rails", "Rake", "Git"]
tags.each {|tag| Tag.create(name: tag) }
#
# blake = User.create(
#   name: "Blake Johnson",
#   email: "blake41@gmail.com",
#   image_url: "https://avatars.githubusercontent.com/u/453844?v=3",
#   provider: "github",
#   uid: "453844"
# )
#
# steven = User.create(
#   name: "Steven Nunez",
#   email: "steven.nunez@gmail.com",
#   image_url: "https://avatars.githubusercontent.com/u/325485?v=3",
#   provider: "github",
#   uid: "325485"
# )

katie = User.create(
  name: "Katie Hoffman",
  email: "testflexchange@gmail.com",
  image_url: "https://avatars.githubusercontent.com/u/5709920?v=3",
  provider: "github",
  uid: "5709920"
)

question = Question.create(
  title: "Nested Resources In Rails", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  asker_id: 1,
)

Answer.create(
  content: "You must foo then bar.",
  question_id: question.id,
  responder_id: 2
)

Answer.create(
  content: "I think you need to bar some more",
  question_id: question.id,
  responder_id: katie.id
)
