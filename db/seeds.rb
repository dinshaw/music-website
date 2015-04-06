# Account
account = Account.create! name: 'PCGI'

# Question
question = account.questions.create!(
  body: 'How was your service today?',
  number_of_answers: 3
)

# Answers
not_so_good = question.answers.create!(
  label: 'Not so good',
  value: 0,
  confirmation: 'Sorry, We can do better!',
  comment: true
)
ok = question.answers.create!(
  label: 'OK',
  value: 50,
  confirmation: 'Thank you.',
  comment: true
)

great = question.answers.create!(
  label: 'Great',
  value: 100,
  confirmation: 'Great, thank you!',
  comment: true
)

# Location
cafeteria = account.locations.create! name: 'Cafeteria'
conference_room = account.locations.create! name: 'Conference_room'

# Terminal
terminal = Terminal.create!(
  location: cafeteria,
  question: question,
)

# Responses
Response.create!([
  { terminal: terminal,
    answer: great,
    comment: 'Loved it!' },
  { terminal: terminal,
    answer: ok,
    comment: nil },
  { terminal: terminal,
    answer: not_so_good,
    comment:  'Service sucked!'},
])



