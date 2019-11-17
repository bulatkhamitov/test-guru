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

tests = Test.create([{ title: 'Ruby Basics',     level: 0, creator: users[1], category: categories[0] },
                     { title: 'Python Basics',   level: 1, creator: users[1], category: categories[1] },
                     { title: 'Python Advanced', level: 2, creator: users[1], category: categories[1] }])

texts = ['What programming methodology does Ruby implement?',
         'What kind of type system does Ruby use?',
         'Python is..',
         'What kind of type system does Python use?',
         'Which library allows to operate with multidensional arrays?',
         'What is the complexity of the built-in sorted function?']

questions = Question.create([{ text: texts[0], test: tests[0] },
                             { text: texts[1], test: tests[0] },
                             { text: texts[2], test: tests[1] },
                             { text: texts[3], test: tests[1] },
                             { text: texts[4], test: tests[2] },
                             { text: texts[5], test: tests[2] }])

answers = Answer.create([{ correct: true,  text: 'Object Oriented Programming', question: questions[0] },
                         { correct: false, text: 'Functional Programming',      question: questions[0] },
                         { correct: true,  text: 'Strong/dynamic typing',       question: questions[1] },
                         { correct: false, text: 'Weak/static typing',          question: questions[1] },
                         { correct: true,  text: 'Interpeted language',         question: questions[2] },
                         { correct: false, text: 'Compiled language',           question: questions[2] },
                         { correct: true,  text: 'Strong/dynamic typing',       question: questions[3] },
                         { correct: false, text: 'Weak/dynamic typing',         question: questions[3] },
                         { correct: true,  text: 'NumPy',                       question: questions[4] },
                         { correct: false, text: 'Matplotlib',                  question: questions[4] },
                         { correct: true,  text: 'O(nlog(n))',                  question: questions[5] },
                         { correct: false, text: 'O(n^2)',                      question: questions[5] }])

passed_tests = PassedTest.create([{ user: users[0], test: tests[0] },
                                  { user: users[1], test: tests[0] },
                                  { user: users[1], test: tests[1] },
                                  { user: users[2], test: tests[2] }])
