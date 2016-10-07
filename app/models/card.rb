class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_many :guesses

  validates :deck_id, :question, :answer, :presence => true

end
