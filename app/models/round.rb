class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :card

  validates :deck_id, :presence => true

  def count_correct_first_guesses
    deck_length = self.deck.cards.count
    round_guesses = Guess.where(round_id: self.id)
    first_guesses = round_guesses.limit(deck_length)
    correct_first_guesses = first_guesses.find_all { |guess| guess.correct? }
    correct_first_guesses.count
  end
end
