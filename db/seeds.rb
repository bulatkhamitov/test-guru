# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Andrew',  email: 'andrew@compuserve.com' },
                     { name: 'Brennan', email: 'brennan@yahoo.com' },
                     { name: 'Cullen',  email: 'cullen@gmail.com' }])

categories = Category.create([{ title: 'Ruby' },
                              { title: 'Python' }])

tests = Test.create([{ title: 'Ruby Basics', level: 0, categories_id: categories[0].id, users_id: users[0].id },
                     { title: 'Python Basics', level: 1, categories_id: categories[1].id, users_id: users[1].id }])

q_texts = ['What programming methodology does Ruby implement?',
           'What kind of type system does Ruby use?',
           'Python is..',
           'What kind of type system does Python use?']

questions = Question.create([{ text: q_texts[0], tests_id: tests[0].id },
                             { text: q_texts[1], tests_id: tests[0].id },
                             { text: q_texts[2], tests_id: tests[1].id },
                             { text: q_texts[3], tests_id: tests[1].id }])

answers = Answer.create([{ correct: true,  text: 'Object Oriented Programming', questions_id: questions[0].id },
                         { correct: false, text: 'Functional Programming', questions_id: questions[0].id },
                         { correct: true,  text: 'Strong/dynamic typing', questions_id: questions[1].id },
                         { correct: false, text: 'Weak/static typing', questions_id: questions[1].id },
                         { correct: true,  text: 'Interpeted language', questions_id: questions[2].id },
                         { correct: false, text: 'Compiled language', questions_id: questions[2].id },
                         { correct: true,  text: 'Strong/dynamic typing', questions_id: questions[3].id },
                         { correct: false, text: 'Weak/dynamic typing', questions_id: questions[3].id }])

passed_tests = Passedtest.create([{ users_id: users[0].id, tests_id: tests[0].id },
                                  { users_id: users[1].id, tests_id: tests[0].id },
                                  { users_id: users[1].id, tests_id: tests[1].id }])
