# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'Ruby' },
                              { title: 'Python' }])

users = User.create([{ name: 'Andrew',  email: 'andrew@compuserve.com', password: 'qwerty123' },
                     { name: 'Brennan', email: 'brennan@yahoo.com',     password: 'zxcvbn456' },
                     { name: 'Cullen',  email: 'cullen@gmail.com',      password: 'asdfgh789' }])

tests = Test.create([{ title: 'Ruby Basics',   level: 0, user_id: users[0].id, category_id: categories[0].id },
                     { title: 'Python Basics', level: 1, user_id: users[1].id, category_id: categories[1].id }])

q_texts = ['What programming methodology does Ruby implement?',
           'What kind of type system does Ruby use?',
           'Python is..',
           'What kind of type system does Python use?']

questions = Question.create([{ text: q_texts[0], test_id: tests[0].id },
                             { text: q_texts[1], test_id: tests[0].id },
                             { text: q_texts[2], test_id: tests[1].id },
                             { text: q_texts[3], test_id: tests[1].id }])

answers = Answer.create([{ correct: true,  text: 'Object Oriented Programming', question_id: questions[0].id },
                         { correct: false, text: 'Functional Programming',      question_id: questions[0].id },
                         { correct: true,  text: 'Strong/dynamic typing',       question_id: questions[1].id },
                         { correct: false, text: 'Weak/static typing',          question_id: questions[1].id },
                         { correct: true,  text: 'Interpeted language',         question_id: questions[2].id },
                         { correct: false, text: 'Compiled language',           question_id: questions[2].id },
                         { correct: true,  text: 'Strong/dynamic typing',       question_id: questions[3].id },
                         { correct: false, text: 'Weak/dynamic typing',         question_id: questions[3].id }])

passed_tests = PassedTest.create([{ user_id: users[0].id, test_id: tests[0].id },
                                  { user_id: users[1].id, test_id: tests[0].id },
                                  { user_id: users[1].id, test_id: tests[1].id }])
