User.create!(email: "bob@belcher.com", password: "password")
10.times{User.create!(email: Faker::Internet.email, password: "1234")}

Deck.create!(theme: "General knowledge")

card_seeds = [
  { deck_id: 1, question: "1+1", answer: "2" },
  { deck_id: 1, question: "What's the opposite of hot", answer: "cold" },
  { deck_id: 1, question: "Which day comes after Wednesday", answer: "Thursday" },
  { deck_id: 1, question: "How many inches are in a foot?", answer: "12" },
  { deck_id: 1, question: "How do you reverse a bcrypt hash?", answer: "You don't" },
  { deck_id: 1, question: "Which planet is closest to the Sun", answer: "Mercury" }
]

card_seeds.each { |card_attributes| Card.create!(card_attributes) }

3.times { Round.create!(user_id: 1, deck_id: 1) }


guess_seeds = [
  {card_id: 1, round_id: 1, potential_answer: "2"},
  {card_id: 2, round_id: 1, potential_answer: "cold"},
  {card_id: 3, round_id: 1, potential_answer: "Thursday"},
  {card_id: 4, round_id: 1, potential_answer: "13"},
  {card_id: 5, round_id: 1, potential_answer: "what that"},
  {card_id: 6, round_id: 1, potential_answer: "The moon"},
  {card_id: 4, round_id: 1, potential_answer: "12"},
  {card_id: 5, round_id: 1, potential_answer: "You don't"},
  {card_id: 6, round_id: 1, potential_answer: "Mercury"},

  {card_id: 1, round_id: 2, potential_answer: "2"},
  {card_id: 2, round_id: 2, potential_answer: "cold"},
  {card_id: 3, round_id: 2, potential_answer: "Thursday"},
  {card_id: 4, round_id: 2, potential_answer: "12"},
  {card_id: 5, round_id: 2, potential_answer: "You don't"},
  {card_id: 6, round_id: 2, potential_answer: "Mercury"},

  {card_id: 1, round_id: 3, potential_answer: "wrong"},
  {card_id: 2, round_id: 3, potential_answer: "wrong"},
  {card_id: 3, round_id: 3, potential_answer: "wrong"},
  {card_id: 1, round_id: 3, potential_answer: "wrong"},
  {card_id: 2, round_id: 3, potential_answer: "cold"},
  {card_id: 3, round_id: 3, potential_answer: "Thursday"},
  {card_id: 4, round_id: 3, potential_answer: "13"},
  {card_id: 5, round_id: 3, potential_answer: "what that"},
  {card_id: 6, round_id: 3, potential_answer: "The moon"},
  {card_id: 4, round_id: 3, potential_answer: "12"},
  {card_id: 5, round_id: 3, potential_answer: "You don't"},
  {card_id: 6, round_id: 3, potential_answer: "Mercury"}
]

guess_seeds.each { |guess| Guess.create!(guess) }
