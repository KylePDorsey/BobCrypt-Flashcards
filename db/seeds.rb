User.create!(email: "bob@belcher.com", password: "password")
10.times{User.create!(email: Faker::Internet.email, password: "1234")}

Deck.create!(theme: "Tin-uuuuuuuuuh Belcher")

Deck.create!(theme: "Linda Belcher")

card_seeds = [
  { deck_id: 1, question: "Who is Tina's biggest crush", answer: "Jimmy Junior" },
  { deck_id: 1, question: "What's the name of Tina's porcelain horse", answer: "Horselain" },
  { deck_id: 1, question: "What scout group is Tina a part of", answer: "Thundergirls" },
  { deck_id: 1, question: "How old is Tina", answer: "13" },
  { deck_id: 1, question: "Is Tina a smart, strong, sensual woman", answer: "Yes" },

  { deck_id: 2, question: "What's Linda's catchphrase", answer: "Alright" },
  { deck_id: 2, question: "What collectible does Linda collect", answer: "Porcelain Babies" },
  { deck_id: 2, question: "What's Linda's sister's name", answer: "Gale" },
  { deck_id: 2, question: "How much does Linda love dinner theater", answer: "A lot" },
  { deck_id: 2, question: "What was the name of Linda's band", answer: "The Tatas" }
]

card_seeds.each { |card_attributes| Card.create!(card_attributes) }

2.times { Round.create!(user_id: 1, deck_id: 1) }
Round.create!(user_id: 1, deck_id: 2)


guess_seeds = [
  {card_id: 1, round_id: 1, potential_answer: "Zeke"},
  {card_id: 2, round_id: 1, potential_answer: "Horselain"},
  {card_id: 3, round_id: 1, potential_answer: "Thundergirls"},
  {card_id: 4, round_id: 1, potential_answer: "12"},
  {card_id: 5, round_id: 1, potential_answer: "No"},
  {card_id: 4, round_id: 1, potential_answer: "13"},
  {card_id: 1, round_id: 1, potential_answer: "Jimmy Junior"},
  {card_id: 5, round_id: 1, potential_answer: "Yes"},

  {card_id: 1, round_id: 2, potential_answer: "Jimmy Junior"},
  {card_id: 2, round_id: 2, potential_answer: "Horselain"},
  {card_id: 3, round_id: 2, potential_answer: "Thundergirls"},
  {card_id: 4, round_id: 2, potential_answer: "13"},
  {card_id: 5, round_id: 2, potential_answer: "Yes"},

  {card_id: 1, round_id: 3, potential_answer: "wrong"},
  {card_id: 2, round_id: 3, potential_answer: "wrong"},
  {card_id: 3, round_id: 3, potential_answer: "wrong"},
  {card_id: 4, round_id: 3, potential_answer: "wrong"},
  {card_id: 5, round_id: 3, potential_answer: "wrong"},
  {card_id: 1, round_id: 3, potential_answer: "Alright"},
  {card_id: 2, round_id: 3, potential_answer: "Porcelain Babies"},
  {card_id: 3, round_id: 3, potential_answer: "Gale"},
  {card_id: 4, round_id: 3, potential_answer: "A lot"},
  {card_id: 5, round_id: 3, potential_answer: "The Tatas"}
]

guess_seeds.each { |guess| Guess.create!(guess) }
