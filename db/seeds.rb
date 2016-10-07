10.times{User.create!(email: Faker::Internet.email, password: "1234")}

Deck.create!(theme: "General knowledge")

card_seeds = [
  {deck_id: 1, question: "1+1", answer: "2"},
  {deck_id: 1, question: "What's the opposite of hot", answer: "cold"},
  {deck_id: 1, question: "Which day comes after Wednesday", answer: "Thursday"},
  {deck_id: 1, question: "How many inches are in a foot?", answer: "12"},
  {deck_id: 1, question: "How do you reverse a bcrypt hash?", answer: "You don't"},
  {deck_id: 1, question: "Which planet is closest to the Sund", answer: "Mercury"}
]

card_seeds.each { |card_attributes| Card.create!(card_attributes) }

