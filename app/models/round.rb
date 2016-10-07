class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :card

  validates :deck_id, :presence => true

end
